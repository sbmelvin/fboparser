let parser = require('./parser/parser.js');

parser.run( err => {
	if (err) throw err;
	console.log("Parsing complete.");
});
