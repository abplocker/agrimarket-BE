var express = require('express');
var app = express();
var cors = require('cors');
const path = require('path');
//Cấu hình body-parser...
var bodyParser = require('body-parser');
const auth_middleware = require('./app/config/auth_middleware');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());
app.use('/images', express.static(path.join(__dirname, 'images')));
// Các routers...
// Sắp xếp theo thứ tự...
require('./app/routers/category_router')(app); 
require('./app/routers/product_router')(app); 
require('./app/routers/post_router')(app);
require('./app/routers/guest_router')(app); 
require('./app/routers/handle_file_router')(app);
app.use(auth_middleware.isAuth); 
// Token hợp lệ, mới chạy vào các router sau.
require('./app/routers/user_router')(app); 
require('./app/routers/cart_router')(app); 
require('./app/routers/order_router')(app); 

// require('./app/routers/order_router')(app);...
app.listen(3000, function () { 
	console.log("Server listening on http://localhost:3000");
})