const router = require('express').Router();
const UserController = require('../controllers/User');

router.post('/register',UserController.register);
router.post('/login', UserController.login);
router.post('/update', UserController.updateUserInfo);
module.exports = router;