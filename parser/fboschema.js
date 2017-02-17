module.exports = FBOSchema;

function FBOSchema(opts) {
	this._outerTagRegex = opts.outerTagRegex;
	this._fields = opts.fields;
	this._emptyRecord = {};
	this.init();
}

FBOSchema.prototype.init = function() {
	this._fields.forEach( field => {
		this._emptyRecord[field.name] = '';
	});
}

FBOSchema.prototype.getEmptyRecord = function() {
	return Object.assign({}, this._emptyRecord);
}

FBOSchema.prototype.parse = function(data, cb){
	let matches = data.match(this._outerTagRegex) || [];

	let parsedObjects = matches.map( match => {
		let record = this.getEmptyRecord();

		match.split('\n').forEach( line => {
			this._fields.forEach( field => {
				let fieldMatch = field.regex.exec(line);
				if (fieldMatch) {
					record[field.name] = fieldMatch[1].trim();
				}
			});
		});

		return record;
	});

	cb(undefined, parsedObjects);
}