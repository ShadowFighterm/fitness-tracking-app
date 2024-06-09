const User = require('../models/User');

exports.sendFriendRequest = async (req, res) => {
  const { fromUserId, toUserId } = req.body;

  try {
     // Validate input
    if (!fromUserId || !toUserId) {
      return res.status(400).json({ error: 'Invalid request data.' });
    }
    await User.updateOne(
      { _id: fromUserId }, 
      { $addToSet: { friendRequestsSent: toUserId } }
    );

    await User.updateOne(
      { _id: toUserId },
      { $addToSet: { friendRequestsReceived: fromUserId } }
    );

    res.status(200).send('Friend request sent.');
  } catch (error) {
    res.status(500).send(error);
  }
};

exports.acceptFriendRequest = async (req, res) => {
  const { fromUserId, toUserId } = req.body;

  try {
    await User.updateOne(
      { _id: fromUserId },
      {
        $pull: { friendRequestsSent: toUserId },
        $addToSet: { friends: toUserId }
      }
    );

    await User.updateOne(
      { _id: toUserId },
      {
        $pull: { friendRequestsReceived: fromUserId },
        $addToSet: { friends: fromUserId }
      }
    );

    res.status(200).send('Friend request accepted.');
  } catch (error) {
    res.status(500).send(error);
  }
};

exports.declineFriendRequest = async (req, res) => {
  const { fromUserId, toUserId } = req.body;

  try {
    await User.updateOne(
      { _id: fromUserId },
      { $pull: { friendRequestsSent: toUserId } }
    );

    await User.updateOne(
      { _id: toUserId },
      { $pull: { friendRequestsReceived: fromUserId } }
    );

    res.status(200).send('Friend request declined.');
  } catch (error) {
    res.status(500).send(error);
  }
};

exports.removeFriend = async (req, res) => {
  const { userId1, userId2 } = req.body;

  try {
    await User.updateOne(
      { _id: userId1 },
      { $pull: { friends: userId2 } }
    );

    await User.updateOne(
      { _id: userId2 },
      { $pull: { friends: userId1 } }
    );

    res.status(200).send('Friend removed.');
  } catch (error) {
    res.status(500).send(error);
  }
};
