const router = require('express').Router();
const UserController = require('../controllers/User');

router.post('/register',UserController.register);
router.post('/login', UserController.login);
router.post('/update', UserController.updateUserInfo);
router.post('/addFriend', UserController.addFriend);
router.post('/removeFriend', UserController.removeFriend);
router.post('/getFriends', UserController.getUsersFriends);
router.post('/getUsers', UserController.getUsersWithName);
module.exports = router;