const { create_document, get_document } = require("../controller/File");
const express = require("express");
const route = express.Router();

//Middleware
const { auth } = require("./../middleware/auth");
const { upload } = require("./../middleware/upload");

route.post("/create_document", auth, upload.array("files"), create_document);
route.post("/get_document", auth, get_document);

module.exports = route;
