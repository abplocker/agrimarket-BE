module.exports = function (router) {
	var JWT = require('../config/security');
	var userController = require('../controllers/user_controller');
// Test jwt
	router.get('/token', async function (req, res){
		const token = await JWT.createAccessToken(req.headers);
		res.send({token: token})
	});
	router.get('/refreshtoken', async function (req, res){
		const token = await JWT.createRefreshToken(req.headers);
		res.send({token: token})
	});
	router.get('/refresh_access_token', async function (req, res){
		const token = await JWT.refreshAccessToken(req.headers.authorization);
		res.send({token: token})
	});
	router.get('/check_access_token', async function (req, res){
		try {
		const check = await JWT.checkAccessToken(req.headers.authorization);
		res.send(check)
		} catch (error) {
            res.status(401).send(error)
        }
	});
	router.get('/check_refresh_token', async function (req, res){
		try {
		const check = await JWT.checkRefreshToken(req.headers.authorization);
		res.send(check)
		console.log(check);
		} catch (error) {
            res.status(401).send(error)
        }
	});
	router.get('/login',userController.login);

	router.post('/register', userController.createUser);

};