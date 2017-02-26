let fs = require('fs');
let tags = '(AGENCY|AMDCSS|ARCHDATE|ARCHIVE|AWARD|AWARDEE|AWDAMT|AWDDATE|AWDNBR|CLASSCOD|COMBINE|CONTACT|DATE|DESC|DONBR|EMAIL|FAIROPP|FOJA|JA|LINENBR|LINK|LOCATION|MOD|MODNBR|NAICS|NTYPE|OFFADD|OFFICE|POPADDRESS|POPCOUNTRY|POPZIP|PRESOL|RESPDATE|SETASIDE|SNOTE|SOLNBR|SRCSGT|STAUTH|SUBJECT|UNARCHIVE|URL|YEAR|ZIP)';
let regexStr = `(^<${tags}>[\\s\\S]*?)(?=</?${tags}>)`;

let regex = new RegExp(regexStr, 'mg');
console.log(regex);

function normalize(text) {
	return text.replace(normalizeRegex, '$1');
}

function splitMatch(match) {
	let tags = '(AGENCY|AMDCSS|ARCHDATE|ARCHIVE|AWARD|AWARDEE|AWDAMT|AWDDATE|AWDNBR|CLASSCOD|COMBINE|CONTACT|DATE|DESC|DONBR|EMAIL|FAIROPP|FOJA|JA|LINENBR|LINK|LOCATION|MOD|MODNBR|NAICS|NTYPE|OFFADD|OFFICE|POPADDRESS|POPCOUNTRY|POPZIP|PRESOL|RESPDATE|SETASIDE|SNOTE|SOLNBR|SRCSGT|STAUTH|SUBJECT|UNARCHIVE|URL|YEAR|ZIP)';
	let regexStr = `(^<${tags}>[\\s\\S]*?)(?=</?${tags}>)`;
	let regex = new RegExp(regexStr, 'mg');
	console.log(regex);
	return match.match(regex);
}

fs.readFile('./fbofeed.txt', 'utf8', (err, data) => {
	data = 
	data = splitMatch(data);

	console.log(data);
});
