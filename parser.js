const fs = require('fs');
const path = require('path');

const presol = require("./presol.js");
/*
const srcsgt = require("srcsgt");
const snote 	= require("snote");
const combine = require("combine");
const amdcss = require("amdcss");
const mod = require("mod");
const award = require("award");
const ja = require("ja");
const fairopp = require("fairopp");
const archive = require("archive");
const unarchive = require("unarchive");
*/

const FBOFEED_DIR = '/Users/stephen/Development/fbo_data/FBOFeed';

// PARSE PRESOL

const files = fs.readdirSync(FBOFEED_DIR);

files.forEach((file) => {
	fs.readFile(path.join(FBOFEED_DIR, file), 'utf8', (err, data) => {
		console.log("Parsing ", file);
		if (err) throw err;

		// Parse data
		let presolRecords = presol.parse(data);

		presolRecords.length? console.log(presolRecords.length) : console.log("No results");
	});
});