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
    db.query("SELECT * FROM product ORDER BY ProductUpdatedAt DESC, ProductCreatedAt DESC", function (err, product) {
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

Product.getBySellerId = function (id, result) {
    db.query("SELECT * FROM product WHERE UserID = ?", id, function (err, product) {
        if (err || product.length == 0)
            result (null);
        else
        {
            const products = [];
            const categoryIDs = product.map(item => item.CategoryID); 
            categoryIDs.forEach(function (categoryID, index) {
                db.query("SELECT * FROM category WHERE CategoryID = ?", categoryID, function (err, category) {
                    if (err || category.length == 0) {
                        result(products);
                    } else {
                        // Thêm thông tin chi tiết của Product vào mảng products
                        products.push({
                            ProductName : product[index].ProductName,
                            ProductQuantity : product[index].ProductQuantity,
                            ProductPrice : product[index].ProductPrice,
                            ProductImageDefault : product[index].ProductImageDefault,
                            CategoryID: category[0].CategoryID,
                            CategoryName: category[0].CategoryName,
                        });
                    }
                    if (index === categoryIDs.length - 1) {
                        result(products);
                    }
                });
            });



        }
        // Trả về thông tin của nhiều sản phẩm trong category
    });
}

Product.create = function (data, result) {
    db.query("INSERT INTO product SET ?", data, function (err, product) {
        if (err) {
            result (null);
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
    if (!productName.trim()) {
        result();
        return;
    }
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