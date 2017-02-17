
module.exports.parse = function(data, cb) {
	const fboschema = require('./fboschema.js');
	
	let outerTagRegex = /(?:<PRESOL>)[\s\S]*?(?=<\/PRESOL>)/g;

	let regex = {
		date: /<DATE>(\d+)+/,	 
		year: /<YEAR>(\d)+/,	 
		agency: /<AGENCY>(.*)/,	 
		office: /<OFFICE>(.*)/,	 
		location: /<LOCATION>(.*)/,	 
		zip: /<ZIP>(.*)/,	 
		classcod: /<CLASSCOD>(.*)/,	 
		naics: /<NAICS>(.*)/,	 
		offadd: /<OFFADD>([^<]*)/,	 
		subject: /<SUBJECT>(.*)/,	 
		solnbr: /<SOLNBR>(.*)/,	 
		respdate: /<RESPDATE>(.*)/,	 
		contact: /<CONTACT>(.*)/
	};

	let fields = [
		{ name: 'date', regex: regex.date}, 
		{ name: 'year', regex: regex.year}, 
		{ name: 'agency', regex: regex.agency}, 
		{ name: 'office', regex: regex.office},
		{ name: 'location', regex: regex.location},
		{ name: 'zip', regex: regex.zip},
		{ name: 'classcod', regex: regex.classcod},
		{ name: 'naics', regex: regex.naics},
		{ name: 'offadd', regex: regex.offadd},
		{ name: 'subject', regex: regex.subject},
		{ name: 'solnbr', regex: regex.solnbr},
		{ name: 'respdate', regex: regex.respdate},
		{ name: 'contact', regex: regex.contact}
	];

	const presolSchema = new fboschema({
		outerTagRegex: outerTagRegex,
		fields: fields
	});

	presolSchema.parse(data, cb);
}