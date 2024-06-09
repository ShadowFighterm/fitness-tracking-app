const express = require('express');
const router = express.Router();
const communityController = require('../controllers/community');

router.post('/sendFriendRequest', communityController.sendFriendRequest);
router.post('/acceptFriendRequest', communityController.acceptFriendRequest);
router.post('/declineFriendRequest', communityController.declineFriendRequest);
router.post('/removeFriend', communityController.removeFriend);

module.exports = router;
