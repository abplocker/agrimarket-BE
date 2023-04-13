var express = require('express');
var app = express();
var cors = require('cors');

//Cấu hình body-parser
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());
// Các routers

require('./app/routers/user.router')(app);
require('./app/routers/cart.router')(app);
require('./app/routers/category.router')(app);
require('./app/routers/product.router')(app);
// // require('./app/routers/order.router')(app);

app.listen(3000, function () {
	console.log("Server listening on http://localhost:3000");
})