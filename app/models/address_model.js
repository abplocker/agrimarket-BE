const db = require('../config/mysql');
const Address = function (address) {
    this.AddressID = address.AddressID;
    this.UserID = address.UserID;
    this.AddressName = address.AddressName;
    this.AddressPhone = address.AddressPhone;
    this.Default = address.Default;
}

Address.getByUserId = function (id, result) {
    db.query("SELECT * FROM address WHERE UserID = ?", id, function (err, address) {
        if (err || address.length == 0)
            result (err);
        else
            result(address);
    });
}

Address.getDefaultAddressByUserID = function (id, result) {
    db.query("SELECT * FROM address WHERE Default = 1 AND  UserID = ?", id, function (err, address) {
        if (err || address.length == 0)
            result (err);
        else
            result(address[0]);
    });
}
// chưa xong
Address.create = function (data, result) {
    // Khi tạo mà chọn nó là địa chỉ mặc định thì set toàn bộ các địa chỉ cũ thành default = 0
    if (data.Default == 1)
        db.query("UPDATE address SET Default = 0 WHERE UserID=?", data.UserID, function (err) {
            if (err) {
                result (err.sqlMessage);
            }
        })
    db.query("INSERT INTO address SET ?", data, function (err, address) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result({ id: address.AddressID, ...data });
    });
}

Address.detele = function (data, result) {
    db.query("DELETE FROM address WHERE AddressID =?", data.AddressID, function (err) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result("Đã xoá thành công");
    });
}

Address.update_info = function (data, result) {
    db.query("UPDATE address SET AddressName =?, AddressPhone = ?, Default=? WHERE AddressID =?",
        [data.AddressName, data.AddressPhone, data.Default,data.AddressID], function (err, address) {
            if (err) {
                result (err.sqlMessage);
            }
            else
                result({ id: address.AddressID, ...data });
        });
}
module.exports = Address;