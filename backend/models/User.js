const { Double } = require('mongodb');
const db = require('../db/db');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const { Schema } = mongoose;

// Example calorie burn rates (calories per minute)
const calorieBurnRates = {
    'running': 10,
    'cycling': 8,
    'swimming': 7,
    'walking': 3,
    'weightlifting': 6,
    'yoga': 4,
    'jumping rope': 12,
    'aerobics': 9
};

// Subdocument schema for workout
const WorkoutSchema = new Schema({
    exercise: {
        type: String,
        required: [true, 'Exercise name is required']
    },
    sets: {
        type: Number,
        required: false,
    },
    reps: {
        type: Number,
        required: false,
    },
    duration: {
        type: Number, // duration in minutes
        required: false
    },
    date: {
        type: Date,
        required: [true, 'Date of workout is required']
    }
}, { timestamps: true });

const UserSchema = new Schema({
    name: {
        type: String,
        required: [true, 'Name is Required'],
    },
    email: {
        type: String,
        required: [true, 'Email is required'],
        unique: true,
        lowercase: true,
        match: [/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/, 'Please type a valid email address'],
    },
    password: {
        type: String,
        required: [true, 'Password is required'],
    },
    age: {
        type: Number,
        required: [true, 'Age is required'],
    },
    gender: {
        type: String,
        enum: ['male', 'female'],
        required: [true, 'Gender is required']
    },
    height: {
        type: Number,
        required: [true, 'Height is required']
    },
    weight: {
        type: Number,
        required: [true, 'Weight is required']
    },
    goal: {
        type: String,
        required: [true, 'Goal is required']
    },
    activity: {
        type: String,
        required: [true, 'Activity Level is required']
    },
    friends: [{
        type: Schema.Types.ObjectId,
        ref: 'User',
    }],
    workouts: [WorkoutSchema], // Array of workout subdocuments
    caloriesBurned: {
        type: Number,
        default: 0
    }
}, { timestamps: true });

UserSchema.pre('save', async function() {
    var user = this;
    if (!user.isModified('password'))
        return;
    try {
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hashSync(user.password, salt);
        user.password = hash;
    } catch (err) {
        console.log(err);
    }
});

UserSchema.methods.ComparePassword = async function(password) {
    try {
        const IsValid = await bcrypt.compareSync(password, this.password);
        return IsValid;
    } catch (err) {
        console.log(err);
    }
};

UserSchema.methods.calculateDailyCalories = function(date) {
    const startOfDay = new Date(date.setHours(0, 0, 0, 0));
    const endOfDay = new Date(date.setHours(23, 59, 59, 999));

    let totalCalories = 0;

    this.workouts.forEach(workout => {
        if (workout.date >= startOfDay && workout.date <= endOfDay) {
            const calorieRate = calorieBurnRates[workout.exercise] || 0;
            if (workout.duration) {
                totalCalories += workout.duration * calorieRate;
            }
        }
    });

    return totalCalories;
};

UserSchema.methods.updateCaloriesBurned = function() {
    let totalCalories = 0;

    this.workouts.forEach(workout => {
        const calorieRate = calorieBurnRates[workout.exercise] || 0;
        if (workout.duration) {
            totalCalories += workout.duration * calorieRate;
        }
    });

    this.caloriesBurned = totalCalories;
};

UserSchema.pre('save', function(next) {
    this.updateCaloriesBurned();
    next();
});

UserSchema.pre('findOneAndUpdate', function(next) {
    this._update.$set = this._update.$set || {};
    this.updateCaloriesBurned();
    this._update.$set.caloriesBurned = this.caloriesBurned;
    next();
});

UserSchema.post('findOneAndUpdate', async function(doc) {
    await doc.updateCaloriesBurned();
    await doc.save();
});

UserSchema.methods.addFriend = async function(friendId) {
    if (!this.friends.includes(friendId)) {
        this.friends.push(friendId);
        await this.save();
    }
};

UserSchema.methods.getFriendsCalories = async function() {
    const today = new Date();
    const startOfDay = new Date(today.setHours(0, 0, 0, 0));
    const endOfDay = new Date(today.setHours(23, 59, 59, 999));
    
    // Find all friends
    const friends = await mongoose.model('User').find({
        _id: { $in: this.friends }
    });

    // Calculate calories burned for each friend
    const friendsCalories = friends.map(friend => {
        let totalCalories = 0;

        friend.workouts.forEach(workout => {
            if (workout.date >= startOfDay && workout.date <= endOfDay) {
                const calorieRate = calorieBurnRates[workout.exercise] || 0;
                if (workout.duration) {
                    totalCalories += workout.duration * calorieRate;
                }
            }
        });

        return {
            name: friend.name,
            caloriesBurned: totalCalories
        };
    });

    return friendsCalories;
};

const UserMod = mongoose.model('User', UserSchema);
module.exports = UserMod;
