const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

app.get('/', (req, res) => {
    res.send('<h1>Hello, World!</h1>');
  });

app.post('/data', (req,res) => {
    console.log('Received POST request:', req);

  // Access the request body specifically
  const receivedData = req.body;
  console.log('Request body:', receivedData); // Logs 'hello' in your example

  res.send('Data received'); 
})

app.listen(port, ()=>{
    console.log('server listening on port 3000');
})