const jwt = require('jsonwebtoken');
const token = require('./JWT');
// Create a token
let createToken = function (user) {
    return new Promise(function (resolve, reject) {
        jwt.sign({ data: user }, token.ACCESS_TOKEN,{
            algorithm: 'HS256',
            expiresIn: token.ACCESS_TOKEN_LIFETIME,
        },
            function (err, newToken) {
                if (err) {
                    return reject(err);
                } else {
                    return resolve(newToken);
                }
            }
        );
    });
};

let checkToken = function (data) {
    return new Promise(function (resolve, reject) {
        jwt.verify(data.token, token.ACCESS_TOKEN,
            function (err, decoded) {
                if (err) {
                    return reject(err);
                } else {
                    return resolve(decoded);
                }
            }
        );
    });
};

module.exports = {
    createToken:createToken,
    checkToken:checkToken,
}