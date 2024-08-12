const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const fs = require('fs');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

app.get('/', (req, res) => {
    res.send('<h1>Hello, World!</h1>');
});

app.get('/command', (req, res) => {
  res.send('Turn On');
});

app.post('/data', (req,res) => {
    console.log('Received POST request:', req);

  // Access the request body specifically
  const receivedData = req.body;
  console.log('Request body:', receivedData); // Logs 'hello' in your example
  console.log('Type of receivedData is: ', typeof receivedData);
  fs.writeFile('output.txt', JSON.stringify(receivedData), (err) => {
    if (err) throw err;
    console.log('Data written to file\n');
  })

  res.send('Data received'); 
})

app.listen(port, ()=>{
    console.log('server listening on port 3000');
})