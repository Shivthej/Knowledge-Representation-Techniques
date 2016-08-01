var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'KRT Project: Twitter Sentiment' });
});


/*Get statistics page*/
router.get('/visual', function(req, res, next) {
  res.render('visual', { title: 'Sentiment Statistics' });
});


/* Get about page*/
router.get('/about', function(req, res, next) {
  res.render('about', { title: 'About' });
});


/* GET Userlist page. */
var global2;
router.post('/userlist', function(req, res) {
    var db = req.db;
     var userName = req.body.username;
     global2=userName;
    var collection = db.get('sentiment');
    console.log(global2);
    console.log("data being retrieved from the database");
    collection.find({'text' : new RegExp(userName,"i")},{},function(e,docs){
        res.render('userlist', {
            "userlist" : docs, global2
        });
    });
});


/* Renders users information*/
var global;
router.get('/comments/:id', function(req, res) {
     var db =req.db;
    console.log("Data retrieval based on the id");
     var collection =db.get('sentiment');
     var userID=parseInt(req.params.id);
     global=userID;
     console.log(userID);
    collection.find({'id': userID},function(e,docs){
        console.log(docs.length);
        res.render('comments', { "title": "User Information" , "docs" : docs, global2 });
     });
});


/*Add User Comment */
router.post('/comments', function(req, res) {

    var db = req.db;
    console.log("Posting comment to ID");
    var collection = db.get('sentiment');
    var userID = parseInt(global);
    var userComment=req.body.Comment;
    console.log(userID + "  " + userComment);

    var part1={"id":userID};
    var part2={"$set":{"comment":userComment}};

    console.log("Data set");

    
    // updating DB
    collection.update(part1,part2, false, false, function(err){
        res.redirect("/comments/"+userID);
    });
       res.redirect("/comments/"+userID); 
    });


module.exports = router;
