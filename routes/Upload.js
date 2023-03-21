const express = require("express");
const route = express.Router();

//controller
const {image} = require('../controller/Upload')

route.get("/image/:fileName",image);

module.exports = route;
