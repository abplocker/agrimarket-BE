var jwt = require('../config/security');
let isAuth = async function(req, res, next) {
    var token = req.headers.authorization;
    if (token) {
        try {
            console.log(token);
            var authData = await jwt.checkToken(token);
            req.auth = authData;
            next();
        } catch (error) {
            return res.status(401).send({Message:"Invalid token",Error: error})
        }
    }
    else{
        return res.status(401).send("Need a token");
    }
}

module.exports = {
    isAuth:isAuth,
};