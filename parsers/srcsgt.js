
module.exports.parse = function(data) {
	// Find PRESOL entries
	let matches = data.match(/(?:<PRESOL>)[\s\S]*?(?=<\/PRESOL>)/g) || [];

	let presolRecords = [];

	matches.forEach((match) => {
		let presolRecord = {};

		match.split('\n').forEach((line) => {
			let fields = [
				{ name: 'date', regex: /<DATE>(\d+)+/ },
				{ name: 'year', regex: /<YEAR>(\d)+/ },
				{ name: 'agency', regex: /<AGENCY>(.*)/ },
				{ name: 'office', regex: /<OFFICE>(.*)/ },
				{ name: 'location', regex: /<LOCATION>(.*)/ },
				{ name: 'zip', regex: /<ZIP>(.*)/ },
				{ name: 'classcod', regex: /<CLASSCOD>(.*)/ },
				{ name: 'naics', regex: /<NAICS>(.*)/ },
				{ name: 'offadd', regex: /<OFFADD>([^<]*)/ },
				{ name: 'subject', regex: /<SUBJECT>(.*)/ },
				{ name: 'solnbr', regex: /<SOLNBR>(.*)/ },
				{ name: 'respdate', regex: /<RESPDATE>(.*)/ },
				{ name: 'contact', regex: /<CONTACT>(.*)/ }];

			fields.forEach((field) => {
				let fieldMatch = field.regex.exec(line);
				if (fieldMatch) presolRecord[field.name] = fieldMatch[1];
			});
		});

		presolRecords.push(presolRecord);
	});

	return presolRecords;
}