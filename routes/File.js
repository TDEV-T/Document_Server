const {
  create_document,
  get_document,
  get_part,
} = require("../controller/File");
const express = require("express");
const route = express.Router();

//Middleware
const { auth } = require("./../middleware/auth");
const { upload } = require("./../middleware/upload");

route.post("/create_document", auth, upload.array("files"), create_document);
route.post("/get_document", auth, get_document);
route.post("/get_part", auth, get_part);

module.exports = route;
