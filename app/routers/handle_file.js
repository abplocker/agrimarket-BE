const multer = require('multer');
const fs = require('fs');
const path = require('path');
module.exports = function (router) {
    const uploadProduct = multer({ dest: 'images/product' });
    router.post('/uploadProduct', uploadProduct.single('image'), (req, res) => {
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
            res.send({ imageUrl: newFileName });
        });
    })
}