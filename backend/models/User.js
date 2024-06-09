const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const { Schema } = mongoose;
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
  friendRequestsSent: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User'
  }],
  friendRequestsReceived: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User'
  }],
  friends: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User'
  }]
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
    console.log("password", this.password)
    const IsValid = await bcrypt.compareSync(password, this.password);
    return IsValid;
  } catch (err) {
    console.log(err);
  }
}

// Check if the model already exists before defining it
let User;
if (mongoose.models.User) {
  User = mongoose.model('User');
} else {
  User = mongoose.model('User', UserSchema);
}

module.exports = User;
