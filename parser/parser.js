module.exports.run = function(callback) {
	const fbofeed = require('./fbofeed.js');

	const fs = require('fs');
	const path = require('path');		

	const FBOFEED_DIR = '/Users/stephen/Development/fbo_data';
	const CSV_FILENAME = './csv/fbofeed_';
	const tags = ['AMDCSS', 'ARCHIVE', 'AWARD', 'COMBINE', 'EMAIL', 'FAIROPP', 'JA', 'MOD', 'PRESOL', 'SNOTE', 'SRCSGT', 'UNARCHIVE'];

	// Get list of files in FBOFEED_DIR
	function ReadFBOFiles(cb) {
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

						fbofeed.parse(data, (err, result) => {
							if (err) throw err;

							for (let tag in result) {
								let output = '';

								result[tag].forEach( obj => {
									output += objToCSV(obj);
								});

								fs.appendFileSync(CSV_FILENAME + tag + '.csv', output);
							}
						});
					});
				});
			});
		});
	}
	
	function removeExistingCSV(filePath) {
		if (fs.existsSync(filePath)) fs.unlinkSync(filePath);
	}

	function writeHeaders(filePath) {
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