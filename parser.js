let fs = require('fs');

/*
get next line
	if presol then
		get next line
		if contains <date> then
			parse line for date
		if 
*/


fs.readFile('fbofeed', 'utf8', (err, data) => {
	if (err) throw err;

	// Find PRESOL entries
	let matches = data.match(/(?:<PRESOL>)(.|\n)*(?=<\/PRESOL>)/g);

	// Print contract date in PRESOL
	matches.forEach((match) => {
		let presol = [];
		presol.date = parseLine(match, /<DATE>(\d+)+/);
		presol.year = parseLine(match, /<YEAR>(\d)+/);
		presol.agency = parseLine(match, /<AGENCY>(.*)/);
		presol.office = parseLine(match, /<OFFICE>(.*)/);
		presol.location = parseLine(match, /<LOCATION>(.*)/);
		presol.zip = parseLine(match, /<ZIP>(.*)/);
		presol.classcod = parseLine(match, /<CLASSCOD>(.*)/);
		presol.naics = parseLine(match, /<NAICS>(.*)/);
		presol.offadd = parseLine(match, /<OFFADD>([^<]*)/m);
		presol.subject = parseLine(match, /<SUBJECT>(.*)/);
		presol.solnbr = parseLine(match, /<SOLNBR>(.*)/);
		presol.respdate = parseLine(match, /<RESPDATE>(.*)/);
		presol.contact = parseLine(match, /<CONTACT>(.*)/);
/*
	<DATE>0217
	<YEAR>16
	<AGENCY>Defense Contract Management Agency
	<OFFICE>Defense Contract Management Agency
	<LOCATION>DCMA AQ
	<ZIP>23801-1809
	<CLASSCOD>Q
	<NAICS>524114
	<OFFADD>3901 A Ave
	BLDG 10500 Fort Lee VA 23801-1809
	<SUBJECT>Health and Dental Benefits for Canadian
	<SOLNBR>S5121A-16-T-0006
	<RESPDATE>022416
	<CONTACT>Mark A. Deberry, Phone 8047340423, Email mark.deberry@dcma.mil
	<DESC>DCMA intends to procure from Sun Life &nbsp;supplemental health, dental and life benefits for Canadian foreign national employees as a Sole Source requirement IAW FAR 13.106-1(b) (1) (i).
	<LINK>
	<URL>https://www.fbo.gov/spg/DCMA/DSPPMRO/DCMA-OCB/S5121A-16-T-0006/listing.html
	<DESC>Link To Document
	<SETASIDE>N/A
	<POPCOUNTRY>US
	<POPZIP>23801
	<POPADDRESS>3901 A Ave  
	Building 10500
	Fort Lee, VA
*/

	console.log(presol);
	});
});