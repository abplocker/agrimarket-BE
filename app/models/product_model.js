const db = require('../config/mysql');
const Product = function (product) {
    this.ProductID = product.ProductId;
    this.ProductName = product.ProductName;
    this.ProdcutPrice = product.ProdcutPrice;
    this.ProductDescription = product.ProductDescription;
    this.ProductSlug = product.ProductSlug;
    this.ProductActive = product.ProductActive;
    this.ProductQuantity = product.ProductQuantity;
    this.ProductCreatedAt = product.ProductCreatedAt;
    this.ProductUpdatedAt = product.ProductUpdatedAt;
    this.CategoryID = product.CategoryId;
    this.UserID = product.UserID;
}

Product.get_all = function (result) {
    db.query("SELECT * FROM product", function (err, product) {
        if (err)
            result (err.sqlMessage);
        else{
            result(product);
        }
    });
}
// View product details
Product.getDetail = function (id, result) {
    db.query("SELECT * FROM product WHERE ProductId = ?", id, function (err, product) {
        if (err || product.length == 0)
            result (null);
        else
            result(product[0]);
        // Trả về thông tin của một sản phẩm
    });
}
// Function View catalog
Product.getByCategoryId = function (id, result) {
    db.query("SELECT * FROM product WHERE CategoryId = ?", id, function (err, product) {
        if (err || product.length == 0)
            result (err.sqlMessage);
        else
        {
            result(product);
        }
        // Trả về thông tin của nhiều sản phẩm trong category
    });
}

Product.create = function (data, result) {
    db.query("INSERT INTO product SET ?", data, function (err, product) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result({ id: product.productID,...data });
    });
}

Product.detele = function (data, result) {
    db.query("DELETE FROM product WHERE ProductId =?", data.productID, function (err) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result("Đã xoá thành công");
    });
}

Product.update_info = function (data, result) {
    db.query("UPDATE product SET ? WHERE ProductID =? AND UserID =?", 
    [data,data.ProductID,data.UserID], function (err, product) {
        if (err || product.affectedRows == 0) {
            result (null);
        }
        else
            result({ id: product.productID, ...data });
    });
}

Product.search = function (productName, result) {
    db.query("SELECT * FROM product  WHERE ProductName LIKE?", 
    ["%" + productName + "%"], function (err, product) {
        if (err || product.length == 0) {
            result (product.sqlMessage);
        }
        else
            result(product);
    });
}
module.exports = Product;