const { register,login,check_authen } = require("../controller/User");
const express = require("express");
const route = express.Router();

  
route.post("/register",  register);
route.post("/login",login);

route.post('/check_authen',check_authen);



module.exports = route;