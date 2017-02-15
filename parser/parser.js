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

	let config = {
		user: 'postgres',			//env var: PGUSER
		database: 'fboparser',		//env var: PGDATABASE
		password: 'postgres',		//env var: PGPASSWORD
		host: 'localhost',			// Server hosting the postgres database
		port: 5432,					//env var: PGPORT
		max: 10,					// max number of clients in the pool
	};

	const pg = require('pg').native;
	const pool = new pg.Pool(config);

	const FBOFEED_DIR = '/Users/stephen/Development/fbo_data';
	const OUTFILE = './output.csv';

	let count = 0;
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

						let presolObjs = presol.parse(data);
						let output = '';

						presolObjs.forEach(v => {
							output += objToCSV(v);
						});

						fs.appendFileSync(OUTFILE, output);
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