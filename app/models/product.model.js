const db = require('../mysql');
const Product = function (product) {
    this.ProductId = product.ProductId;
    this.ProductName = product.ProductName;
    this.ProdcutPrice = product.ProdcutPrice;
    this.ProductDescription = product.ProductDescription;
    this.ProductSlug = product.ProductSlug;
    this.ProductActive = product.ProductActive;
    this.ProductQuantity = product.ProductQuantity;
    this.ProductCreatedAt = product.ProductCreatedAt;
    this.ProductUpdatedAt = product.ProductUpdatedAt;
    this.CategoryId = product.CategoryId;
    this.UserId = product.UserId;
}

product.get_all = function (result) {
    db.query("SELECT * FROM product", function (err, product) {
        if (err)
            throw err;
        else
            result(product);
    });

}
// View product details
Product.getDetail = function (id, result) {
    db.query("SELECT * FROM product WHERE ProductId = ?", id, function (err, product) {
        if (err || product.length == 0)
            throw err;
        else
            result(product[0]);
        // Trả về thông tin của một sản phẩm
    });
}
// Function View catalog
Product.getByCategoryId = function (id, result) {
    db.query("SELECT * FROM product WHERE CategoryId = ?", id, function (err, product) {
        if (err || user.length == 0)
            throw err;
        else
            result(product);
        // Trả về thông tin của nhiều sản phẩm trong category
    });
}

product.create = function (data, result) {
    db.query("INSERT INTO product SET ?", data, function (err, product) {
        if (err) {
            throw err;
        }
        else
            result({ id: product.productID,...data });
    });
}

product.detele = function (data, result) {
    db.query("DELETE FROM product WHERE ProductId =?", data.productID, function (err) {
        if (err) {
            throw err;
        }
        else
            result("Đã xoá thành công");
    });
}

product.update_info = function (data, result) {
    db.query("UPDATE product SET ProductName =?, ProductSlug =?, ProductPrice=?, ProductUpdatedAt=? WHERE ProductId =?", 
    [data.ProductName,data.ProductSlug,data.ProductPrice,data.ProductUpdatedAt,data.ProductId], function (err, product) {
        if (err) {
            throw err;
        }
        else
            result({ id: product.productID, ...data });
    });
}
module.exports = Product;