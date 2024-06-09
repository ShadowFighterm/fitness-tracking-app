const app = require('./app');
const port = process.env.port || 4000;
const db = require('./db/db')

app.get('/', (req,res) => 
{
    res.send("Testing backend");
});

app.get('/about', (req,res) => 
{
    res.send("Testing about backend");
});

app.listen(port,() =>
{
    console.log(`Server is runnning at port http://localhost:${port}`);

});
