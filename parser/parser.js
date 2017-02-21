module.exports.run = function(callback) {
	const fs = require('fs');
	const path = require('path');
	const child_process = require('child_process');
	const numCPUs = require('os').cpus().length;

	const FBOFEED_DIR = '/Users/stephen/Development/fbo_data';
	const tags = ['AMDCSS', 'ARCHIVE', 'AWARD', 'COMBINE', 'EMAIL', 'FAIROPP', 'JA', 'MOD', 'PRESOL', 'SNOTE', 'SRCSGT', 'UNARCHIVE'];

	let filesPaths = [];
	let filePromises = [];
	let numChildren = 0;

	// Get list of files in FBOFEED_DIR
	function ReadFBOFiles(cb) {
		fs.readdir(FBOFEED_DIR, (err, files) => {
			if (err) throw err;

			// For each file, craft the full path
			files.forEach(file => {
				let filePath = path.join(FBOFEED_DIR, file);
				let filePromise = new Promise((res, rej) => {
					// Ensure the file is not a directory
					fs.stat(filePath, (err, stats) => {
						if (err) throw err;
						if (stats.isDirectory()) return res(null);
						res(filePath);
					});
				});
				filePromises.push(filePromise);
			});

			Promise.all(filePromises).then((values) => {
				filePaths = values.filter(value => {
					return value? true:false;
				});

				for(let i = 0; i < numCPUs; i++) {
					createWorker();
				}
			}).catch(reason => {
				console.log("Err: ", reason);
			});
		});
	}

	function createWorker() {
		let worker = child_process.fork('./parser/fbofeed.js');
		
		worker.on('message', message => {
			worker.send({filePath: filePaths.pop()});
			console.log(filePaths.length);  
		});

		worker.on('exit', (code, signal) => {
			console.log("Child exited...");
		});

		worker.send({filePath: filePaths.pop()});
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



	ReadFBOFiles(callback);
}