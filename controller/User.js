const bcrypt = require("bcrypt");
const TokenManager = require("./token/token_manager.js");
const { db } = require("../config/db");
const saltRound = 10;

exports.check_authen = async (req,res) => {
  let jwtStatus =  TokenManager.checkAuthentication(req);

  if(jwtStatus != false){
    res.json({status:"success",message:jwtStatus});
  }else{
    res.json({status:"error",message:"Token Error"});
  }
}

exports.register = async (req, res) => {
  let check = "";
  try {
    let information = req.body;
    db.query(
      "SELECT * FROM users WHERE username_user = ?",
      [information.username],
      (err, result) => {
        if (result != "") {
          res.json({ status: "error", message: "Username already to use !" });
        } else {
          bcrypt.genSalt(10, (err, salt) => {
            bcrypt.hash(information.password, salt, function (err, hash) {
              db.query(
                "INSERT INTO users (username_user,password_user,fname_user,lname_user,address_user,tel_user,file_user) VALUES (?,?,?,?,?,?,?)",
                [
                  information.username,
                  hash,
                  information.fname,
                  information.lname,
                  information.address,
                  information.tel,
                  information.profile,
                ],
                (err, result) => {
                  if (err) {
                    res.json({ status: "error", message: err });
                  } else {
                    res.json({
                      status: "success",
                      message: "Success Register ",
                    });
                  }
                }
              );
            });
          });
        }
      }
    );
  } catch (err) {
    console.log(err);
    res.status(500).send("Server Error!");
  }
};

exports.login = async (req, res) => {
  try {
    let information = req.body;
    db.query(
      "SELECT * FROM users WHERE username_user = ? ",
      [information.username],
      (err, users) => {
        if (err) {
          res.json({ status: "error", message: err });
          return;
        }
        if (users.length == 0) {
          res.json({ status: "error", message: "User undefinded" });
        } else {
          bcrypt.compare(
            information.password,
            users[0].password_user,
            (err, isLogin) => {
              if (isLogin) {
                let token = TokenManager.getGenerateToken({username:users[0].username_user});
                res.json({ status: "success", message: "Login Success" ,token});
              } else {
                console.log(information.password);
                console.log(users[0].password_user);
                res.json({ status: "error", message: "Login Failed" });
              }
            }
          );
        }
      }
    );
  } catch (err) {
    console.log(err);
    res.status(500).send("Server Error!");
  }
};
