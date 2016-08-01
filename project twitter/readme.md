% KRT Tweet Project
% Annu Kuriakose, Evlin Steeve
% Spring 2016

# KRT TWEET SEARCH PROJECT

## Prerequisites

1. Ubuntu
2. Nodejs
3. Expressjs
4. MongoDB
5. Browser(Chrome, Mozilla)

## Procedure to install Prerequisites
Type the commands on Ubuntu terminal
1. To install MongoDB -> sudo apt-get install mongodb -y
2. To install Nodejs -> sudo apt-get install nodejs -y
3. To install NPM -> sudo apt-get install npm -y
4. To install Express -> sudo npm install express -g

## Running the Project

1. Copy all the files from the zip folder to the location from where it has to be executed
2. Unzip the project.
3. Start the mongodb server by typing -> mongod
4. Start Nodejs and install: npm install -g express-generator
5. Execute the file csvtojson.js using command - node csvtojson.js
6. Start MongoDB client using command - mongo
7. check if the DB got loaded - DB name - AnnuDB, Collection name - sentiment
8. Execute the command - db.sentiment.find().count(); - count will be 13871.
9. Exit from client and go to the folder newProj and start terminal to the location.
10. Execute the command: npm start
11. open chrome or firefox and load : http://localhost:3000/

## Cross validation

1. You will see the web page running, also the logs in the node terminal.
2. To Add a comment click on Tweet Owner, then a new window will be opened for entering comments.
3. After adding comment you need to check in MongoDB to verify.

