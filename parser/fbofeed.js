/*
Copyright 2016 Stephen Melvin <stephenbmelvin@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

process.on('message', message => {
	switch(message.cmd) {
		case 'parse':
			parse(message.filePath, (err, filePath) => {
				if (err) throw err;
				process.send({cmd: 'done', filePath: filePath});
			});
		break;

		case 'quit':
			process.exit(0);
		break;
	}
});

process.send({cmd: 'begin'});

let outerTags = ['AMDCSS', 'ARCHIVE', 'AWARD', 'COMBINE', 'FAIROPP', 'FSTD', 'ITB', 'JA', 'MOD', 'PRESOL', 'SNOTE', 'SRCSGT', 'SSALE', 'UNARCHIVE'];
let innerTags = ['AGENCY', 'ARCHDATE', 'AWARDEE', 'AWDAMT', 'AWDDATE', 'AWDNBR', 'CBAC', 'CLASSCOD', 'CONTACT', 'CORRECTION', 'DATE', 'DESC', 'DONBR', 'EMAIL', 'FOJA', 'LINENBR', 'LINK', 'LOCATION', 'MODNBR', 'NAICS', 'NTYPE', 'OFFADD', 'OFFICE', 'PASSWORD', 'POPADDRESS', 'POPCOUNTRY', 'POPZIP', 'RESPDATE', 'SETASIDE', 'SOLNBR', 'STAUTH', 'SUBJECT', 'URL', 'YEAR', 'ZIP'];

let tags = outerTags.map(tag => {
	let rgxStr = `(?:<${tag}>)[\\s\\S]*?(?:</${tag}>)`
	return { name: tag, regex: new RegExp(rgxStr, 'g')};
});

let fields = innerTags.map(tag => {
	let rgxStr = `^<${tag}>(.*)`;
	return { name: tag, regex: new RegExp(rgxStr)};
});

function objToCSV(o) {
	let str = '';
	for (let prop in o) {
		let val = o[prop];
		val = val.trim();
		val = (val.length > 0 ? val.replace(/["]/g, `""`) : "NULL");
		val = `"${val}",`;
		str += val;
	}
	str = str.slice(0, -1) + '\n';
	return str;
}

function splitMatch(match) {
	let innerTagJoin = innerTags.join('|');
	let outerTagJoin = outerTags.join('|/');
	let combinedJoin = `${innerTagJoin}|/${outerTagJoin}`

	let regexStr = `(^<(${innerTagJoin})>[\\s\\S]*?)(?=^<(${combinedJoin})>)`;
	let regex = new RegExp(regexStr, 'mg');

	return match.match(regex);
}

function normalize(text) {
	return text.replace(/[\x00-\x09\x0B-\x0C\x0E-\x1F\x7F-\x9F]/g,'');
}

function parseLink(text) {
	let regex = /^<LINK>[\s]+?^<URL>([\s\S]*?)^<DESC>([\s\S]*?)$/m;
	let result = regex.exec(text);
	let url = '';
	let desc = '';
	if (result) {
		url = result[1].trim();
		desc = result[2].trim();
	}
	return {url: url, desc: desc};
}

function parseEmail(text) {
	let regex = /^<EMAIL>[\s]+?^<(?:EMAIL|ADDRESS)>([\s\S]+?)^<DESC>([\s\S]*?)$/m;
	let result = regex.exec(text);
	let email = '';
	let desc = '';
	if (result) {
		email = result[1].trim();
		desc = result[2].trim();
	}
	return {email: email, desc: desc};
}


function parse(filePath, callback) {
	const fs = require('fs');
	const CSV_FILENAME = './db_data/parsed/csv/fbofeed_';

	let emptyRecord = {};

	for (let tag of innerTags) {
		emptyRecord[tag] = '';
	}

	emptyRecord = Object.assign(emptyRecord, {
		poc_email: '',
		poc_email_desc: '',
		link_url: '',
		link_desc: '',
		filename: ''
	});

	// Read the file and parse its contents
	fs.readFile(filePath, 'utf8', (err, data) => {
		if (err) return callback(err);

		data = normalize(data);

		tags.forEach( tag => {
			let matches = data.match(tag.regex) || [];
 
			let records = matches.map( match => {
				let record = Object.assign({}, emptyRecord); 

				match = normalize(match);

				let lines = splitMatch(match);
				let prevTag = '';
 
 				for (let i = 0; i < lines.length; i++) {
					let line = lines[i];

					for (let j = 0; j < fields.length; j++) {
						let field = fields[j];
						let fieldMatch = field.regex.exec(line);
						
						if (fieldMatch) {
							let result;
							switch(field.name) {
								case 'LINK':
									result = parseLink(match);
									record.link_url = result.url;
									record.link_desc = result.desc;
									prevTag = field.name;
									break;

								case 'EMAIL':
									result = parseEmail(match);
									record.poc_email = result.email;
									record.poc_email_desc = result.desc;
									prevTag = field.name;
									break;

								case 'DESC':
									if ((prevTag === 'URL' || prevTag === 'EMAIL' || prevTag === 'ADDRESS') === false) {
										record[field.name] = fieldMatch[1].trim();
									}
									prevTag = field.name;
									break;
									
								default: 
									record[field.name] = fieldMatch[1].trim();
									prevTag = field.name;
									break;
							}
						}
					}
				}
		
				return record;
			});

			let csvOutput = '';

			records.forEach( record => {
				record.filename = filePath;
				csvOutput += objToCSV(record);
			});

			try {
				fs.appendFileSync(CSV_FILENAME + tag.name + '.csv', csvOutput);
			} catch (err) {
				return callback(err);
			}
		});

		console.log("Parsed %s", filePath);
		callback(null, filePath);
	});
}