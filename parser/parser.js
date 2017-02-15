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
		user: 'postgres',				//env var: PGUSER
		database: 'fboparser',			//env var: PGDATABASE
		password: 'postgres',			//env var: PGPASSWORD
		host: 'localhost',			// Server hosting the postgres database
		port: 5432,					//env var: PGPORT
		max: 10,					// max number of clients in the pool
	};

	const pg = require('pg').native;
	const pool = new pg.Pool(config);
	const pgclient = pg.Client;

	const FBOFEED_DIR = '/Users/stephen/Development/fbo_data/';

	let count = 0;
	// Get list of files in FBOFEED_DIR
	function ReadFBOFiles() {
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
					fs.readFile(filePath, 'ascii', (err, data) => {
						if (err) throw err;

						let presolObjs = presol.parse(data);

						presolObjs.forEach(v => {
							let solnbr = v.solnbr;
							let subject = v.subject;

							pool.query('INSERT INTO PRESOL (solnbr, subject) VALUES ($1, $2)', [solnbr, subject], function(err, result) {
								if (err) throw err;
							});
						});
					});
				});
			});
		});
	}

	ReadFBOFiles();
}