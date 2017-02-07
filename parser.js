const presol	= require("./parsers/presol.js");
const srcsgt	= require("./parsers/srcsgt");
const snote		= require("./parsers/snote");
const combine	= require("./parsers/combine");
const amdcss	= require("./parsers/amdcss");
const mod		= require("./parsers/mod");
const award		= require("./parsers/award");
const ja		= require("./parsers/ja");
const fairopp	= require("./parsers/fairopp");
const archive	= require("./parsers/archive");
const unarchive	= require("./parsers/unarchive");

const fs = require('fs');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();
const FBOFEED_DIR = '/Users/stephen/Development/fbo_data/';
//const FBOFEED_DIR = './FBOFEED';

if (fs.existsSync("contracts.sqlite")) {
	console.log("Removing existing contracts.sqlite file");
	fs.unlinkSync("contracts.sqlite");
}


const db = new sqlite3.Database('contracts.sqlite', (err) => {
	if (err) throw err;
	initPresolDatabase();
	ReadFBOFiles();
});

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
				fs.readFile(filePath, 'utf8', (err, data) => {
					if (err) throw err;

					let presolRecords = presol.parse(data);
					return;
					db.serialize(function() {
						var stmt = db.prepare("INSERT INTO PRESOL(date, year, agency, office, location, zip, classcod, naics, offadd, subject, solnbr, respdate, contact) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", (err) => {
							if (err) throw err;
						});
						
						presolRecords.forEach(r => {
							let values = [
								r.date,
								r.year,
								r.agency,
								r.office,
								r.location,
								r.zip,
								r.classcod,
								r.naics,
								r.offadd,
								r.subject,
								r.solnbr,
								r.respdate,
								r.contact
							];

							stmt.run(values, (err) => {
								if (err) throw err;
							});
						});

						stmt.finalize();
					});
				});
			});
		});
	});
}

function initPresolDatabase(callback) {
	let sql = `CREATE TABLE PRESOL (
		date		text,
		year		text,
		agency		text,
		office		text,
		location	text,
		zip			text,
		classcod	text,
		naics		text,
		offadd		text,
		subject		text,
		solnbr		text,
		respdate	text,
		contact		text
		)`;

		db.run(sql, (err) => {
			if (err) throw err;
			console.log("Created PRESOL table.");
		});
}