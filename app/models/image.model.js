const db = require('../config/mysql');
const Image = function (image) {
    this.ImageId = image.ImageId;
    this.ProductId = image.ProductId;
    this.ImageUrl = image.ImageUrl;
    this.ImageDescription = image.ImageDescription;
}
// Just for testing purposes
Image.get_all = function (result) {
    db.query("SELECT * FROM image", function (err, image) {
        if (err)
            result (err.sqlMessage);
        else
            result(image);
    });

}
// Lấy hình của sản phẩm đó
Image.getByProductId = function (id, result) {
    db.query("SELECT * FROM image WHERE ProductId = ?", id, function (err, image) {
        if (err || image.length == 0)
            result (err.sqlMessage);
        else
            result(image);
        // Chỉ cần trả về mảng các Image
    });
}

Image.create = function (data, result) {
    db.query("INSERT INTO image SET ?", data, function (err, Image) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result({ id: Image.ImageID,...data });
    });
}

Image.detele = function (data, result) {
    db.query("DELETE FROM image WHERE ImageId =?", data.ImageID, function (err) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result("Đã xoá thành công");
    });
}

Image.update = function (data, result) {
    db.query("UPDATE image SET ImageDescription =?, ImageUrl =? WHERE ImageId =?", 
    [data.ImageDescription,data.ImageUrl,data.ImageID], function (err, Image) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result({ id: Image.ImageID, ...data });
    });
}
module.exports = Image;