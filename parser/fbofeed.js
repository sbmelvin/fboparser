process.on('message', message => {
	parse(message.filePath, (err, filePath) => {
		if (err) { 
			console.log(err);
			throw err;
		}
		process.send({filePath: filePath});
	});
});

let normalizeRegex = /\n(?!^<\/?(AGENCY|AMDCSS|ARCHDATE|ARCHIVE|AWARD|AWARDEE|AWDAMT|AWDDATE|AWDNBR|CLASSCOD|COMBINE|CONTACT|DATE|DESC|DONBR|EMAIL|FAIROPP|FOJA|JA|LINENBR|LINK|LOCATION|MOD|MODNBR|NAICS|NTYPE|OFFADD|OFFICE|POPADDRESS|POPCOUNTRY|POPZIP|PRESOL|RESPDATE|SETASIDE|SNOTE|SOLNBR|SRCSGT|STAUTH|SUBJECT|UNARCHIVE|URL|YEAR|ZIP)>)/;

let tags = [
	{ name: 'AMDCSS', regex:  new RegExp('(?:<AMDCSS>)[\\s\\S]*?(?=<\/AMDCSS>)', 'g')},
	{ name: 'ARCHIVE', regex:  new RegExp('(?:<ARCHIVE>)[\\s\\S]*?(?=<\/ARCHIVE>)', 'g')},
	{ name: 'AWARD', regex:  new RegExp('(?:<AWARD>)[\\s\\S]*?(?=<\/AWARD>)', 'g')},
	{ name: 'COMBINE', regex:  new RegExp('(?:<COMBINE>)[\\s\\S]*?(?=<\/COMBINE>)', 'g')},
	{ name: 'FAIROPP', regex:  new RegExp('(?:<FAIROPP>)[\\s\\S]*?(?=<\/FAIROPP>)', 'g')},
	{ name: 'JA', regex:  new RegExp('(?:<JA>)[\\s\\S]*?(?=<\/JA>)', 'g')},
	{ name: 'MOD', regex:  new RegExp('(?:<MOD>)[\\s\\S]*?(?=<\/MOD>)', 'g')},
	{ name: 'PRESOL', regex:  new RegExp('(?:<PRESOL>)[\\s\\S]*?(?=<\/PRESOL>)', 'g')},
	{ name: 'SNOTE', regex:  new RegExp('(?:<SNOTE>)[\\s\\S]*?(?=<\/SNOTE>)', 'g')},
	{ name: 'SRCSGT', regex:  new RegExp('(?:<SRCSGT>)[\\s\\S]*?(?=<\/SRCSGT>)', 'g')},
	{ name: 'UNARCHIVE', regex:  new RegExp('(?:<UNARCHIVE>)[\\s\\S]*?(?=<\/UNARCHIVE>)', 'g')}
	];

let fields = [
	{ name: 'agency', regex: /^<AGENCY>(.*)/},
	{ name: 'archdate', regex: /^<ARCHDATE>(.*)/},
	{ name: 'awardee', regex: /^<AWARDEE>(.*)/},
	{ name: 'awdamt', regex: /^<AWDAMT>(.*)/},
	{ name: 'awddate', regex: /^<AWDDATE>(.*)/},
	{ name: 'awdnbr', regex: /^<AWDNBR>(.*)/},
	{ name: 'classcod', regex: /^<CLASSCOD>(.*)/},
	{ name: 'contact', regex: /^<CONTACT>(.*)/},
	{ name: 'date', regex: /^<DATE>(.*)/},
	{ name: 'desc', regex: /^<DESC>(.*)/},
	{ name: 'donbr', regex: /^<DONBR>(.*)/},
	{ name: 'email', regex: /^<EMAIL>(.*)/},
	{ name: 'foja', regex: /^<FOJA>(.*)/},
	{ name: 'linenbr', regex: /^<LINENBR>(.*)/},
	{ name: 'link', regex: /^<LINK>(.*)/},
	{ name: 'location', regex: /^<LOCATION>(.*)/},
	{ name: 'modnbr', regex: /^<MODNBR>(.*)/},
	{ name: 'naics', regex: /^<NAICS>(.*)/},
	{ name: 'ntype', regex: /^<NTYPE>(.*)/},
	{ name: 'offadd', regex: /^<OFFADD>(.*)/},
	{ name: 'office', regex: /^<OFFICE>(.*)/},
	{ name: 'popaddress', regex: /^<POPADDRESS>(.*)/},
	{ name: 'popcountry', regex: /^<POPCOUNTRY>(.*)/},
	{ name: 'popzip', regex: /^<POPZIP>(.*)/},
	{ name: 'respdate', regex: /^<RESPDATE>(.*)/},
	{ name: 'setaside', regex: /^<SETASIDE>(.*)/},
	{ name: 'solnbr', regex: /^<SOLNBR>(.*)/},
	{ name: 'stauth', regex: /^<STAUTH>(.*)/},
	{ name: 'subject', regex: /^<SUBJECT>(.*)/},
	{ name: 'url', regex: /^<URL>(.*)/},
	{ name: 'year', regex: /^<YEAR>(.*)/},
	{ name: 'zip', regex: /^<ZIP>(.*)/}
];

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
	let tags = '(AGENCY|AMDCSS|ARCHDATE|ARCHIVE|AWARD|AWARDEE|AWDAMT|AWDDATE|AWDNBR|CLASSCOD|COMBINE|CONTACT|DATE|DESC|DONBR|EMAIL|FAIROPP|FOJA|JA|LINENBR|LINK|LOCATION|MOD|MODNBR|NAICS|NTYPE|OFFADD|OFFICE|POPADDRESS|POPCOUNTRY|POPZIP|PRESOL|RESPDATE|SETASIDE|SNOTE|SOLNBR|SRCSGT|STAUTH|SUBJECT|UNARCHIVE|URL|YEAR|ZIP)';
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
	let regex = /<EMAIL>[\s\S]+<EMAIL>([\s\S]+)<DESC>(.*)/;
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

	let emptyRecord = {
		agency: '',
		archdate: '',
		awardee: '',
		awdamt: '',
		awddate: '',
		awdnbr: '',
		classcod: '',
		contact: '',
		date: '',
		desc: '',
		donbr: '',
		poc_email: '',
		poc_email_desc: '',
		foja: '',
		linenbr: '',
		link_url: '',
		link_desc: '',
		location: '',
		modnbr: '',
		naics: '',
		ntype: '',
		offadd: '',
		office: '',
		popaddress: '',
		popcountry: '',
		popzip: '',
		respdate: '',
		setaside: '',
		solnbr: '',
		stauth: '',
		subject: '',
		url: '',
		year: '',
		zip: '',
		filename: '',
		record_text: ''
	};

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