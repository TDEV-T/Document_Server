//Controller
const { register, login, currentUser } = require("../controller/User");
const express = require("express");
const route = express.Router();

//middleware
const { auth } = require("./../middleware/auth");

route.post("/register", register);
route.post("/login", login);


route.post("/currentuser",auth,currentUser);

module.exports = route;
