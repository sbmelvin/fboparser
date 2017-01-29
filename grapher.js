let fs = require('fs');
require('console.table');

// PARSE PRESOL
fs.readFile('fbofeed', 'utf8', (err, data) => {
	if (err) throw err;

	let presols = [];
	// Find let entries
	let matches = data.match(/(?:<PRESOL>)[\s\S]*?(?=<\/PRESOL>)/g);

	matches.forEach( match => {
		let presolEntry = [];

		match.match(/<[A-Z]+>/g).forEach(tag => {
			presolEntry.push(tag);
		});

		presols.push(presolEntry);
	});

	console.log(JSON.stringify(presols));
	setTimeout(()=>{},60000);
});