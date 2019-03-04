const fs = require('fs');
const path = require('path');
const child_process = require('child_process');

// Restrict numCPUs to 1 until multicpu parsing is fixed
const numCPUs = 1 || require('os').cpus().length;

const FBOFEED_DIR = process.env.FBOFEED_DIR || '/Users/stephen/Development/priv/fbo_data/feed';

const tags = ['AMDCSS', 'ARCHIVE', 'AWARD', 'COMBINE', 'FAIROPP', 'JA', 'MOD', 'PRESOL', 'SNOTE', 'SRCSGT', 'UNARCHIVE'];

let filesPaths = [];
let filePromises = [];

// Get list of files in FBOFEED_DIR
function ReadFBOFiles(callback) {
	if (FBOFEED_DIR === undefined) throw new Error('FBOFEED_DIR Environment variable not set.');
	
	fs.readdir(FBOFEED_DIR, (err, files) => {
		if (err) return callback(err);

		// For each file, craft the full path
		files.forEach(file => {
			let filePath = path.join(FBOFEED_DIR, file);
			let filePromise = new Promise( (res, rej) => {
				// Ensure the file is not a directory
				fs.stat(filePath, (err, stats) => {
					if (err) return callback(err);
					if (stats.isDirectory()) return res(null);
					res(filePath);
				});
			});

			filePromises.push(filePromise);
		});

		Promise.all(filePromises).then( values => {
			filePaths = values.filter( value => {
				return value != null;				
			});
			
			filePaths = filePaths.sort();
			
			for(let i = 0; i < numCPUs; i++) {
				createWorker(callback);
			}
		}).catch( err => {
			console.log("Err: ", err);
		});
	});
}

function createWorker(callback) {
	let worker = child_process.fork('./parser/fbofeed.js');

	worker.on('message', message => {
		let path = filePaths.pop();

		let command = {};

		if (path === undefined) { 
			command = { cmd: 'quit' };
		} else {
			command = { cmd: 'parse', filePath: path };
		}

		worker.send(command);
	});

	worker.on('exit', (code, signal) => {
		console.log("Child exited with signal: %s, code: %s", signal, code);
	});
}

module.exports.run = function(callback) {
	ReadFBOFiles(callback);
}
