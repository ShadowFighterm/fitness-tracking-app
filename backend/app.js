const express = require('express');
const app = express();

const WorkoutProgressRoutes = require('./routes/WorkoutProgress');
const UserRoutes = require('./routes/User');
const BodyParser = require('body-parser');

app.use(BodyParser.json());
app.use('/user', UserRoutes); 
app.use('/progress', WorkoutProgressRoutes);

module.exports = app;