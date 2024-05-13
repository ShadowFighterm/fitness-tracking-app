const express = require('express');
const app = express();

const UserRoutes = require('./routes/User');
const BodyParser = require('body-parser');

app.use(BodyParser.json());
app.use('/', UserRoutes);

module.exports = app;