const db = require('../config/mysql');
const CartItem = function (cartitem) {
    this.CartItemID = cartitem.CartItemID;
    this.UserID = cartitem.UserID;
    this.ProductId = cartitem.ProductId;
    this.Quantity = cartitem.Quantity;
    this.SumPrice = cartitem.SumPrice;
}

CartItem.getByUserId = function (id, result) {
    db.query("SELECT * FROM cartitem WHERE UserID = ?", id, function (err, cartitems) {
        if (err || cartitems.length == 0) {
            result(err);
        } else {
            // Lấy danh sách ProductID từ kết quả truy vấn cartitem
            const productIDs = cartitems.map(item => item.ProductID); // Tại cái mảng này là đối tượng, mình thì cần lấy cái ID là được gòi, làm màu tí, { ProductID: 'P01' }
            // Tạo một mảng để lưu trữ kết quả cuối cùng
            const products = [];

            // Sử dụng vòng lặp để truy vấn thông tin chi tiết cho từng ProductID
            productIDs.forEach(function (productID, index) {
                db.query("SELECT * FROM product WHERE ProductID = ?", productID, function (err, product) {
                    if (err || product.length == 0) {
                        result(products);
                    } else {
                        // Thêm thông tin chi tiết của Product vào mảng products
                        products.push({
                            CartItemID: cartitems[index].CartItemID,
                            Quantity: cartitems[index].Quantity,
                            SumPrice: cartitems[index].SumPrice,
                            ProductID: product[0].ProductID,
                            ProductName: product[0].ProductName,
                            ProductPrice: product[0].ProductPrice,
                            ProductImageDefault: product[0].ProductImageDefault
                        });
                    }
                    // Kiểm tra xem đã truy vấn thông tin cho tất cả ProductID hay chưa
                    if (index === productIDs.length - 1) {
                        // Gọi callback result với kết quả cuối cùng
                        result(products);
                    }
                });
            });
        }
    });
}
// Lấy thông tin cart tạm thời của user
CartItem.getCartDrawerContainer = function (id, result) {
    db.query("SELECT ProductID FROM cartitem WHERE UserID = ?", id, function (err, cartitems) {
        if (err || cartitems.length == 0) {
            result(err);
        } else {
            // Lấy danh sách ProductID từ kết quả truy vấn cartitem
            const productIDs = cartitems.map(item => item.ProductID); // Tại cái mảng này là đối tượng, mình thì cần lấy cái ID là được gòi, làm màu tí, { ProductID: 'P01' }
            // console.log("cartitems",cartitems);
            // console.log("productIDs",productIDs);

            // Tạo một mảng để lưu trữ kết quả cuối cùng
            const products = [];

            // Sử dụng vòng lặp để truy vấn thông tin chi tiết cho từng ProductID
            productIDs.forEach(function (productID, index) {
                db.query("SELECT * FROM product WHERE ProductID = ?", productID, function (err, product) {
                    if (err || product.length == 0) {
                        result(products);
                    } else {
                        // Thêm thông tin chi tiết của Product vào mảng products
                        products.push({
                            ProductID: product[0].ProductID,
                            ProductName: product[0].ProductName,
                            ProductPrice: product[0].ProductPrice,
                            ProductImageDefault: product[0].ProductImageDefault
                        });
                    }
                    // Kiểm tra xem đã truy vấn thông tin cho tất cả ProductID hay chưa
                    if (index === productIDs.length - 1) {
                        // Gọi callback result với kết quả cuối cùng
                        result(products);
                    }
                });
            });
        }
    });
}

CartItem.addCartItem = function (data, result) {
    db.query("SELECT * FROM cartitem WHERE UserID = ? and ProductID = ?", [data.UserID, data.ProductID], function (err, getCartRecord) {
        if (getCartRecord[0] == null)
            db.query("INSERT INTO cartitem SET ?", data, function (err, cartitem) {
                if (err) {
                    result(null);
                }
                else
                    result(cartitem);
            });
        else
            db.query("INSERT INTO cartitem SET ? ON DUPLICATE KEY UPDATE Quantity = Quantity + 1", getCartRecord, function (err, cartitem) {
                if (err) {
                    result(null);
                }
                else
                    result(cartitem);
            });
    });
}

// Thay đổi giá trị số lượng
/*
    TH1: User click tăng 1. Gọi script, truyền change_amount = quantity + 1
    TH2: User click giảm 1. Gọi script, truyền change_amount = quantity - 1
    TH3: User sửa trực tiếp số lượng. Gọi script, truyền change_amount = số lượng user nhập

    Thực thi lệnh UPDATE, gọi đến trigger update_amount
*/

CartItem.changeQuantity = function (data, result) {
    db.query("UPDATE cartitem SET Quantity =? WHERE CartItemID =?"
        , [data.ChangeAmount, data.CartItemID]
        , function (err, cartitem) {
            if (err || cartitem.affectedRows == 0) {
                result(null);
            }
            else {
                db.query("SELECT SumPrice from cartitem WHERE CartItemID =?"
                    , [data.CartItemID]
                    , function (err, SumPrice) {
                        result(SumPrice[0]);
                    })
            }
        });
}

CartItem.detele = function (data, result) {
    db.query("DELETE FROM cartitem WHERE CartItemID =?", data.CartItemID, function (err, cartitem) {
        if (err || cartitem.affectedRows == 0) {
            result(null);
        }
        else
            result("Đã xoá thành công");
    });
}

// CartItem.update_info = function (data, result) {
//     db.query("UPDATE cartitem SET FullName =?, Email =?, Phone=?, Avatar=? WHERE CartId =?",
//         [data.FullName, data.Email, data.Phone, data.Avatar, data.CartID], function (err, cartitem) {
//             if (err) {
//                 result (err.sqlMessage);
//             }
//             else
//                 result({ id: cartitem.CartID, ...data });
//         });
// }
// CartItem.checkUser = function(data,result){
//     db.query("SELECT * FROM cartitem WHERE UserID = ?", id, function (err, cartitem) {
//         if (err || cartitem.length == 0){
//             console.log(err);
//             result (err);
//         }
//         else
//             result(cartitem);
//     });
// }
module.exports = CartItem;