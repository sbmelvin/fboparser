module.exports.run = function(callback) {
	const presol	= require('./presol.js');
	const srcsgt	= require('./srcsgt');
	const snote		= require('./snote');
	const combine	= require('./combine');
	const amdcss	= require('./amdcss');
	const mod		= require('./mod');
	const award		= require('./award');
	const ja		= require('./ja');
	const fairopp	= require('./fairopp');
	const archive	= require('./archive');
	const unarchive	= require('./unarchive');

	const fs = require('fs');
	const path = require('path');		

	const FBOFEED_DIR = '/Users/stephen/Development/fbo_data';
	const OUTFILE = './presol.csv';

	// Get list of files in FBOFEED_DIR
	function ReadFBOFiles(cb) {
		removeExistingCSV(OUTFILE);
		writeHeaders();
		fs.readdir(FBOFEED_DIR, (err, files) => {
			if (err) throw err;

			// For each file, craft the full path
			files.forEach(file => {
				let filePath = path.join(FBOFEED_DIR, file);

				// Ensure the file is not a directory
				fs.stat(filePath, (err, stats) => {
					if (err) throw err;
					if (stats.isDirectory()) return;

					// Read the file and parse its contents
					fs.readFile(filePath, 'utf8', (err, data) => {
						if (err) throw err;

						presol.parse(data, (err, presolObjs) => {
							let output = '';

							presolObjs.forEach(v => {
								output += objToCSV(v);
							});

							fs.appendFileSync(OUTFILE, output);
						});
					});
				});
			});
		});
	}
	
	function removeExistingCSV(filePath) {
		if (fs.existsSync(filePath)) fs.unlinkSync(filePath);
	}

	function writeHeaders() {
		let fields = [
			'date', 
			'year', 
			'agency', 
			'office', 
			'location', 
			'zip', 
			'classcod', 
			'naics', 
			'offadd', 
			'subject', 
			'solnbr', 
			'respdate', 
			'contact'
		];

		let str = '';

		fields.forEach( field => {
			str += (field + ',');
		});

		str = str.slice(0, -1) + '\n';

		fs.appendFileSync(OUTFILE, str);
	}

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

	ReadFBOFiles(callback);
}