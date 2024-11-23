


const express = require('express');
const app = express();

app.get('/', (req, res) => {
  // Modify the response object in place
  res.set('Content-Type', 'text/plain');
  res.set('X-Custom-Header', 'Example');
  res.send('Hello, world!');
});



