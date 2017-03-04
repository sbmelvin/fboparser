const fs = require('fs');
const path = require('path');
const child_process = require('child_process');
const numCPUs = require('os').cpus().length;

const FBOFEED_DIR = process.env.FBOFEED_DIR;
const tags = ['AMDCSS', 'ARCHIVE', 'AWARD', 'COMBINE', 'FAIROPP', 'JA', 'MOD', 'PRESOL', 'SNOTE', 'SRCSGT', 'UNARCHIVE'];

let filesPaths = [];
let filePromises = [];

// Get list of files in FBOFEED_DIR
function ReadFBOFiles(callback) {
	fs.readdir(FBOFEED_DIR, (err, files) => {
		if (err) return callback(err);

		// For each file, craft the full path
		files.forEach(file => {
			let filePath = path.join(FBOFEED_DIR, file);
			let filePromise = new Promise((res, rej) => {
				// Ensure the file is not a directory
				fs.stat(filePath, (err, stats) => {
					if (err) return callback(err);
					if (stats.isDirectory()) return res(null);
					res(filePath);
				});
			});
			filePromises.push(filePromise);
		});

		Promise.all(filePromises).then((values) => {
			filePaths = values.filter(value => {
				return (value === null || value === undefined)? false:true;
			});
			
			filePaths = filePaths.sort();
			
			for(let i = 0; i < numCPUs; i++) {
				createWorker(callback);
			}
		}).catch(reason => {
			console.log("Err: ", reason);
		});
	});
}

function createWorker(callback) {
	let worker = child_process.fork('./parser/fbofeed.js');

	worker.on('message', message => {
		if (message.cmd === 'done') {
			console.log('Worker completed parsing ', message.filePath);
		} 

		let path = filePaths.pop();
		worker.send({filePath: path});
	});

	worker.on('exit', (code, signal) => {
		console.log("Child exited with signal: %s, code: %s", signal, code);
	});
}

module.exports.run = function(callback) {
	ReadFBOFiles(callback);
}