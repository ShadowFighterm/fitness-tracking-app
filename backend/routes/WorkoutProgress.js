const router = require('express').Router();
const WorkoutProgressController = require('../controllers/WorkoutProgress');

router.post('/add', WorkoutProgressController.addProgress);
router.post('/get', WorkoutProgressController.getProgressByEmail);

module.exports = router;
