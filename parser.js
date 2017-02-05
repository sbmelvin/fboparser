const presol = require("./presol.js");
const fs = require('fs');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();
const FBOFEED_DIR = '/Users/stephen/Development/fbo_data/';

const db = new sqlite3.Database('contracts.sqlite', (err) => {
	if (err) throw err;
	ReadFBOFiles();
});


/*
const srcsgt	= require("srcsgt");
const snote		= require("snote");
const combine	= require("combine");
const amdcss	= require("amdcss");
const mod		= require("mod");
const award		= require("award");
const ja		= require("ja");
const fairopp	= require("fairopp");
const archive	= require("archive");
const unarchive	= require("unarchive");
*/

// PARSE PRESOL

// Get list of files in FBOFEED_DIR
function ReadFBOFiles() {
	fs.readdir(FBOFEED_DIR, (err, files) => {
		if (err) throw err;

		// For each file, craft the full path
		files.forEach((file) => {
			let filePath = path.join(FBOFEED_DIR, file);

			// Ensure the file is not a directory
			fs.stat(filePath, (err, stats) => {
				if (stats.isDirectory()) return;

				// Read the file and parse its contents
				let data = fs.readFileSync(filePath, 'utf8');

				if (data) {
					let presolRecords = presol.parse(data);
					console.log(filePath, ": ", presolRecords.length);
				}
			});
		});
	});
}