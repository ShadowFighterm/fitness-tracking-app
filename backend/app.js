const express = require('express');
const bodyParser = require('body-parser');
const UserRoutes = require('./routes/User');
const communityRoutes = require('./routes/community');

const app = express();

// Middleware
app.use(bodyParser.json());

// Routes
app.use('/api/user', UserRoutes);
app.use('/api/community', communityRoutes);

module.exports = app;
