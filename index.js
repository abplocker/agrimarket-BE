var express = require('express');
var app = express();
var cors = require('cors');
const multer = require('multer');
const fs = require('fs');
const path = require('path');
const upload = multer({ dest: 'images/product' });
//Cấu hình body-parser...
var bodyParser = require('body-parser');
const auth_middleware = require('./app/config/auth_middleware');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());
app.use('/images', express.static(path.join(__dirname, 'images')));
app.post('/upload', upload.single('image'), (req, res) => {
	if (!req.file) {
	  return res.status(400).json({ error: 'No file uploaded' });
	}
  
	// Rename the file to avoid conflicts
	const originalFileName = req.file.originalname;
	const extension = path.extname(originalFileName);
	const newFileName = `${Date.now()}${extension}`;
	const filePath = path.join(req.file.destination, newFileName);
  	fs.rename(req.file.path, filePath, (error) => {
	  if (error) {
		console.log('Error moving file:', error);
		return res.status(500).json({ error: 'Failed to save the file' });
	  }
  
	  // Return the URL or any other response you need
	  const imageUrl = `/images/product/${newFileName}`;
	  res.send({ imageUrl: newFileName });
	});
  });
// Các routers...
// Sắp xếp theo thứ tự...
require('./app/routers/category_router')(app); // comment
require('./app/routers/product_router')(app); // comment
require('./app/routers/post_router')(app); // comment
require('./app/routers/guest_router')(app); // comment
// app.use(auth_middleware.isAuth); // comment
// Token hợp lệ, mới chạy vào các router sau.
require('./app/routers/user_router')(app); // comment
require('./app/routers/cart_router')(app); // comment
// // require('./app/routers/order_router')(app);...


app.listen(3000, function () { // comment
	console.log("Server listening on http://localhost:3000");
})