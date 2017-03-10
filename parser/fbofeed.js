process.on('message', message => {
	if (message.cmd === 'parse') {
		parse(message.filePath, (err, filePath) => {
			if (err) throw err;
			process.send({cmd: 'done', filePath: filePath});
		});
	} else if (message.cmd === 'quit') {
		process.exit(0);
	}
});

process.send({cmd: 'begin'});
let outerTags = ['AMDCSS', 'ARCHIVE', 'AWARD', 'COMBINE', 'FAIROPP', 'FSTD', 'ITB', 'JA', 'MOD', 'PRESOL', 'SNOTE', 'SRCSGT', 'SSALE', 'UNARCHIVE'];
let innerTags = ['AGENCY', 'ARCHDATE', 'AWARDEE', 'AWDAMT', 'AWDDATE', 'AWDNBR', 'CLASSCOD', 'CONTACT', 'CORRECTION', 'DATE', 'DESC', 'DONBR', 'EMAIL', 'FOJA', 'LINENBR', 'LINK', 'LOCATION', 'MODNBR', 'NAICS', 'NTYPE', 'OFFADD', 'OFFICE', 'PASSWORD', 'POPADDRESS', 'POPCOUNTRY', 'POPZIP', 'RESPDATE', 'SETASIDE', 'SOLNBR', 'STAUTH', 'SUBJECT', 'URL', 'YEAR', 'ZIP'];

let tags = outerTags.map((tag) => {
	let rgxStr = `(?:<${tag}>)[\\s\\S]*?(?=<\/${tag}>)`;
	return { name: tag, regex: new RegExp(rgxStr, 'g')};
});

let fields = innerTags.map((tag) => {
	let rgxStr = `^<${tag}>(.*)`;
	return { name: tag, regex: new RegExp(rgxStr)};
});

function objToCSV(o) {
	let str = '';
	for (let prop in o) {
		let val = o[prop];
		val = val.trim();
		if (val.length > 0) {
			val = val.replace(/["]/g,'""');
			val = '"' + val + '"';
		}
		
		str += (val + ',');
	}
	str = str.slice(0, -1) + '\n';
	return str;
}

function splitMatch(match) {
	let tags = `(${innerTags.join('|')}${outerTags.join('|')})`;
	let regexStr = `(^<${tags}>[\\s\\S]*?)(?=</?${tags}>)`;
	let regex = new RegExp(regexStr, 'mg');

	return match.match(regex);
}

function normalize(text) {
	return text.replace(/\u0000/g,'');
}

function parseLink(text) {
	let regex = /<LINK>[\s\S]+<URL>([\s\S]+)<DESC>(.*)/;
	let result = regex.exec(text);
	let url = '';
	let desc = '';
	if (result) {
		url = result[1].trim();
		desc = result[2].trim();
	}
	return {url: url, desc: desc};
}

function parseEmail(text){
	let regex = /<EMAIL>[\s\S]+<(?:EMAIL|ADDRESS)>([\s\S]+)<DESC>(.*)/;
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
	const CSV_FILENAME = './csv/fbofeed_';

	let emptyRecord = {};

	for (let tag of innerTags) {
		emptyRecord[tag] = '';
	}

	emptyRecord = Object.assign(emptyRecord, {
		poc_email: '',
		poc_email_desc: '',
		link_url: '',
		link_desc: '',
		filename: '',
		record_text: ''
	});

	let result = {};

	// Read the file and parse its contents
	fs.readFile(filePath, 'utf8', (err, data) => {
		if (err) return callback(err);

		data = normalize(data);

		tags.forEach( tag => {
			let matches = data.match(tag.regex) || [];
			//	console.log("tag: %s, len: %d", tag.name, matches.length);

			let records = matches.map( match => {
				let record = Object.assign({}, emptyRecord); 

				match = normalize(match);

				let lines = splitMatch(match);
				lines.forEach( line => {
					fields.forEach( field => {
						let fieldMatch = field.regex.exec(line);
						
						if (fieldMatch) {
							let result;
							switch(field.name) {
								case 'link':
									result = parseLink(match);
									record.link_url = result.url;
									record.link_desc = result.desc;
									break;

								case 'email':
									result = parseEmail(match);
									record.poc_email = result.email;
									record.poc_email_desc = result.desc;
									break;

								default: 
									record[field.name] = fieldMatch[1].trim();
							}
						}
					});
				});
				
				record.record_text = match;
				return record;
			});

			let csvOutput = '';

			records.forEach( record => {
				record.filename = filePath;
				csvOutput += objToCSV(record);
			});


			fs.appendFile(CSV_FILENAME + tag.name + '.csv', csvOutput, (err) => {
				if (err) return callback(err);
			});
		});

		console.log("Parsed %s", filePath);
		callback(null, filePath);
	});
}