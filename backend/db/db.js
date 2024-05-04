const mongoose = require('mongoose');

const connection = mongoose.createConnection(`mongodb://127.0.0.1:27017/fitness_app`).on
(
    'open',() => 
    {
        console.log('Successfully connected to the database');
    }
).on('error',(error) =>
{
    console.log(`Error connecting to database, details: ${error}`);
});

module.exports = connection;