const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");
const { readdirSync } = require("fs");
const multer = require('multer');

//middle ware
app.use(bodyParser.json({limit:'20mb'}));
app.use(cors());
app.use(express.json());


readdirSync('./routes').map((r)=> app.use('/api', require('./routes/'+r)))

app.listen(3456, (err) => {
  console.log("Server Started");
});
