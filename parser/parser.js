const fs = require('fs');
const path = require('path');
const child_process = require('child_process');
const numCPUs = require('os').cpus().length;

const FBOFEED_DIR = '/Users/stephen/Development/fbo_data';
const tags = ['AMDCSS', 'ARCHIVE', 'AWARD', 'COMBINE', 'FAIROPP', 'JA', 'MOD', 'PRESOL', 'SNOTE', 'SRCSGT', 'UNARCHIVE'];

let filesPaths = [];
let filePromises = [];
let workers = [];
let numChildren = 0;

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
				return value? true:false;
			});
			
			for(let i = 0; i < 1; i++) {
				createWorker();
			}
		}).catch(reason => {
			console.log("Err: ", reason);
		});
	});
}

function createWorker() {
	let worker = child_process.fork('./parser/fbofeed.js');
	workers.push(worker);
	
	worker.on('message', message => {
		let path = filePaths.pop();
		console.log(filePaths.length, path);
		worker.send({filePath: filePaths.pop()});
	});

	worker.on('exit', (code, signal) => {
		console.log("Child exited with signal: %s, code: %s", signal, code);
	});

	worker.send({filePath: filePaths.pop()});
}
module.exports.run = function(callback) {
	ReadFBOFiles(callback);
}