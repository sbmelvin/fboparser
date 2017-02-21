process.on('message', message => {
	if (message.filePath === undefined) {
		process.exit(0);
	}
	
	parse(message.filePath, (err) => {
		if (err) throw err;
		process.send("Gimme");
	});
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

function parse(filePath, cb) {
	const fs = require('fs');
	const CSV_FILENAME = './csv/fbofeed_';

	let tags = [
		{ name: 'AMDCSS', regex:  new RegExp('(?:<AMDCSS>)[\\s\\S]*?(?=<\/AMDCSS>)', 'g')},
		{ name: 'ARCHIVE', regex:  new RegExp('(?:<ARCHIVE>)[\\s\\S]*?(?=<\/ARCHIVE>)', 'g')},
		{ name: 'AWARD', regex:  new RegExp('(?:<AWARD>)[\\s\\S]*?(?=<\/AWARD>)', 'g')},
		{ name: 'COMBINE', regex:  new RegExp('(?:<COMBINE>)[\\s\\S]*?(?=<\/COMBINE>)', 'g')},
		{ name: 'EMAIL', regex:  new RegExp('(?:<EMAIL>)[\\s\\S]*?(?=<\/EMAIL>)', 'g')},
		{ name: 'FAIROPP', regex:  new RegExp('(?:<FAIROPP>)[\\s\\S]*?(?=<\/FAIROPP>)', 'g')},
		{ name: 'JA', regex:  new RegExp('(?:<JA>)[\\s\\S]*?(?=<\/JA>)', 'g')},
		{ name: 'MOD', regex:  new RegExp('(?:<MOD>)[\\s\\S]*?(?=<\/MOD>)', 'g')},
		{ name: 'PRESOL', regex:  new RegExp('(?:<PRESOL>)[\\s\\S]*?(?=<\/PRESOL>)', 'g')},
		{ name: 'SNOTE', regex:  new RegExp('(?:<SNOTE>)[\\s\\S]*?(?=<\/SNOTE>)', 'g')},
		{ name: 'SRCSGT', regex:  new RegExp('(?:<SRCSGT>)[\\s\\S]*?(?=<\/SRCSGT>)', 'g')},
		{ name: 'UNARCHIVE', regex:  new RegExp('(?:<UNARCHIVE>)[\\s\\S]*?(?=<\/UNARCHIVE>)', 'g')}
		];

	let fields = [
		{ name: 'agency', regex: /<AGENCY>(.*)/},
		{ name: 'archdate', regex: /<ARCHDATE>(.*)/},
		{ name: 'awardee', regex: /<AWARDEE>(.*)/},
		{ name: 'awdamt', regex: /<AWDAMT>(.*)/},
		{ name: 'awddate', regex: /<AWDDATE>(.*)/},
		{ name: 'awdnbr', regex: /<AWDNBR>(.*)/},
		{ name: 'classcod', regex: /<CLASSCOD>(.*)/},
		{ name: 'contact', regex: /<CONTACT>(.*)/},
		{ name: 'date', regex: /<DATE>(.*)/},
		{ name: 'desc', regex: /<DESC>(.*)/},
		{ name: 'donbr', regex: /<DONBR>(.*)/},
		{ name: 'email', regex: /<EMAIL>(.*)/},
		{ name: 'foja', regex: /<FOJA>(.*)/},
		{ name: 'linenbr', regex: /<LINENBR>(.*)/},
		{ name: 'link', regex: /<LINK>(.*)/},
		{ name: 'location', regex: /<LOCATION>(.*)/},
		{ name: 'modnbr', regex: /<MODNBR>(.*)/},
		{ name: 'naics', regex: /<NAICS>(.*)/},
		{ name: 'ntype', regex: /<NTYPE>(.*)/},
		{ name: 'offadd', regex: /<OFFADD>([^<]*)/},
		{ name: 'office', regex: /<OFFICE>(.*)/},
		{ name: 'popaddress', regex: /<POPADDRESS>(.*)/},
		{ name: 'popcountry', regex: /<POPCOUNTRY>(.*)/},
		{ name: 'popzip', regex: /<POPZIP>(.*)/},
		{ name: 'respdate', regex: /<RESPDATE>(.*)/},
		{ name: 'setaside', regex: /<SETASIDE>(.*)/},
		{ name: 'solnbr', regex: /<SOLNBR>(.*)/},
		{ name: 'stauth', regex: /<STAUTH>(.*)/},
		{ name: 'subject', regex: /<SUBJECT>(.*)/},
		{ name: 'url', regex: /<URL>(.*)/},
		{ name: 'year', regex: /<YEAR>(.*)/},
		{ name: 'zip', regex: /<ZIP>(.*)/}
	];

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
		email: '',
		foja: '',
		linenbr: '',
		link: '',
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
		filename: ''
	};

	let result = {};

	// Read the file and parse its contents
	fs.readFile(filePath, 'utf8', (err, data) => {
		if (err) throw err;

		tags.forEach( tag => {
			let matches = data.match(tag.regex) || [];
			//	console.log("tag: %s, len: %d", tag.name, matches.length);

			let parsedObjects = matches.map( match => {
				let record = Object.assign({}, emptyRecord); 

				match.split('\n').forEach( line => {
					fields.forEach( field => {
						let fieldMatch = field.regex.exec(line);
						if (fieldMatch) {
							return record[field.name] = fieldMatch[1].trim();
						}
					});
				});

				return record;
			});

			result[tag.name] = parsedObjects;

			for (let tag in result) {
				let output = '';

				result[tag].forEach( obj => {
					obj.filename = filePath;
					output += objToCSV(obj);
				});

				fs.appendFile(CSV_FILENAME + tag + '.csv', output, (err) => {
					if (err) throw err;
				});
			}
		});

		console.log("Parsed %s", filePath);
		cb();
	});
}