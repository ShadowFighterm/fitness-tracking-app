const mongoose = require('mongoose');
const db = require('../db/db');
const { Schema } = mongoose;

const WorkoutProgressSchema = new Schema({
    email:
    {
        type: String,
        required: true,
        unique: true
    },
    date: {
        type: Array,
        required: true
    },
    caloriesBurnt: {
        type: Array,
        required: true
    },
    steps: {
        type: Array,
        required: true
    },
    time: {
        type: Array,
        required: true
    },
    heartRate: {
        type: Array,
        required: true
    },
}, { timestamps: true });

const WorkoutProgress = db.model('WorkoutProgress', WorkoutProgressSchema);
module.exports = WorkoutProgress;