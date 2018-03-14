const gulp = require('gulp');
const mysqlDump = require('mysqldump');
const fs = require('fs');
const mysql = require('mysql');
const configJson = require('./dumpConfig.json');

const databases = configJson.database;
const config = {
	host: configJson.host,
	user: configJson.user,
	password: configJson.password,
	dest: configJson.dest
};

function getDB(){
	if (!fs.existsSync(config.dest)){
		fs.mkdirSync(config.dest);
	}
	var time = new Date().getTime();
	var dbName = databases;

	mysqlDump({
		host: config.host,
		user: config.user,
		password: config.password,
		database: dbName,
		dest: `${config.dest}${dbName}-${time}.sql`
	},function(err){
		console.log(`create ${config.dest}${dbName}-${time}.sql file`);
	});
}

function readdirAsync(path) {
	return new Promise(function (resolve, reject) {
		fs.readdir(path, function (error, result) {
			if (error) {
				reject(error);
			} else {
				resolve(result);
			}
		});
	});
}

function importDB(){

	let glodata = '';
	let dbName = databases;
	let sqlTime = 0;

	let connection = mysql.createConnection({
		host     : config.host,
		user     : config.user,
		password : config.password,
		database : dbName,
		multipleStatements: true
	});

	readdirAsync(config.dest).then((data) => {
		for (let i = 0; i < data.length; i++) {
			let t = data[i].replace(`${databases}-`, '').replace('.sql', '');
			sqlTime = ( sqlTime > t ) ? sqlTime : t;
		}

		if ( sqlTime == 0 ) {
			console.log('No backup file!');
			return false;
		}

		fs.readFile(`${config.dest}${databases}-${sqlTime}.sql`,
			// callback function that is called when reading file is done
			function(err, data) {
				if (err) console.log( err );
				// data is a buffer containing file content
				glodata = data.toString('utf8').replace(/\n/g, "");

				connection.connect();
				console.log('importing databases...');

				connection.query(glodata , function (error, results, fields) {
					if (error) console.log( error );
					console.log('import databases finished');
				});
				connection.end();
		});
	});
}

function emptyDB(){

	var glodata = '';
	var dbName = databases;

	var connection = mysql.createConnection({
		host     : config.host,
		user     : config.user,
		password : config.password,
		database : dbName,
		multipleStatements: true
	});

	var tbl_names = [],
		dropStr = '';
	connection.connect();
	connection.query(`SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = '${dbName}'`, function(err, result, fields){
		if (err) console.log( err );

		if ( result.length <= 0 ) {
			connection.end();
			console.log('Database is empty!');
			return false;
		}

		for (var i = 0; i < result.length; i++) {
			let tbl = result[i].TABLE_NAME;
			tbl_names.push(tbl);
			dropStr = `${dropStr}DROP TABLE ${tbl};`;
		}
		connection.query(dropStr, function(error, result, fields){
			if (error) console.log( error );
			console.log('drop Done');
		});
		connection.end();
	});
}

gulp.task('dump', function(){
	getDB();
});

gulp.task('import', function(){
	importDB();
});

gulp.task('empty', function(){
	emptyDB();
});

gulp.task('export', ['dump']);
gulp.task('update', ['empty', 'import']);
gulp.task('default', ['export']);