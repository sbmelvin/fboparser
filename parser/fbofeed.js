
module.exports.parse = function(data, cb) {	
	let tags = ['AMDCSS', 'ARCHIVE', 'AWARD', 'COMBINE', 'EMAIL', 'FAIROPP', 'JA', 'MOD', 'PRESOL', 'SNOTE', 'SRCSGT', 'UNARCHIVE'];

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
		{ name: 'snote', regex: /<SNOTE>(.*)/},
		{ name: 'solnbr', regex: /<SOLNBR>(.*)/},
		{ name: 'srcsgt', regex: /<SRCSGT>(.*)/},
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
		snote: '',
		solnbr: '',
		srcsgt: '',
		stauth: '',
		subject: '',
		url: '',
		year: '',
		zip: ''
	};

	let result = {};

	tags.forEach( tag => {
		let tagRegex = new RegExp('(?:<' + tag + '>)[\\s\\S]*?(?=<\\/' + tag + '>)', 'g');

		let matches = data.match(tagRegex) || [];

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

		result[tag] = parsedObjects;
	});

	cb(undefined, result);
}