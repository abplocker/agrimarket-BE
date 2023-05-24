const multer = require('multer');
const fs = require('fs');
const path = require('path');
module.exports = function (router) {
    const pathProduct = multer({ dest: 'images/product' });
    router.post('/uploadProduct', pathProduct.single('image'), (req, res) => {
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
    router.delete('/deleteFile', (req, res) => {
        const filename = req.body.FileName;
        if (!filename) {
            return res.status(400).send({ error: 'Không tìm thấy file' });
        }
        const filePath = path.join('images/product', filename);
        fs.unlink(filePath, (error) => {
            if (error) {
                return res.status(500).json({ error: 'Xoá ảnh thất bại' });
            }
            res.send({ message: 'Xoá ảnh thành công' });
        });
    });
}