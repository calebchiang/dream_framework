




app.get('/', (req, res) => {
  // Accessing a parameter from the query string
  const name = req.query.name;

  // Assuming 'name' is a string (no type checks)
  res.send(`Hello, ${name}!`);
});







