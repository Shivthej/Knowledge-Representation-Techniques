var MongoClient = require('mongodb').MongoClient;
var assert = require('assert');
var format = require('utils').format;
var Converter = require("csvtojson").Converter;
var fs = require("fs");
var mongojs = require('mongojs');
var myjson;
var JSONResult;

var url = "mongodb://localhost:27017/";



var inputFile = "Sentiment.csv";
var fileStream = fs.createReadStream(inputFile);

var csvConverter = new Converter({constructResult:true});

csvConverter.on("end_parsed",function(jsonObj){
   	myjson = jsonObj;
	JSONResult = JSON.stringify(myjson);
	fs.writeFileSync('test.json', JSONResult, 'utf8');
	
});

fileStream.pipe(csvConverter);

MongoClient.connect(url,function(err, db){
        if(err){
                console.log("Database connectivity failed. start MongoDB first!!!");
        }
        else{
                console.log("Connected to DB");

                loadData(db, function(){ 
			db.close();             
                });
        }
});


var loadData = function(db, callback){
	var json;
	fs.readFile('test.json', 'utf8', function (err, data) {
		if (err) throw err;
		json = JSON.parse(data);
	var database = mongojs('AnnuDB', ["sentiment"]);
	database.sentiment.insert(json, function(err, doc) {					
		if(err) throw err;
		else{
		 console.log("insert Successfull");		
		 process.exit(0);
		}
	});
	});
	
	
	

};
