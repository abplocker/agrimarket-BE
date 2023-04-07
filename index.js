var express = require('express');
var app = express();

//Cấu hình body-parser
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Các routers

require('./app/routers/user.router')(app);


app.listen(3000, function () {
	console.log("Server listening on http://localhost:3000");
})