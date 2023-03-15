const bcrypt = require("bcrypt");
const TokenManager = require("../functions/token/token_manager.js");
const { db } = require("../config/db");

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
                "INSERT INTO users (username_user,password_user,fname_user,lname_user,address_user,tel_user) VALUES (?,?,?,?,?,?)",
                [
                  information.username,
                  hash,
                  information.fname,
                  information.lname,
                  information.address,
                  information.tel,
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
      "SELECT * FROM users,types WHERE username_user = ? AND type_user = id_tu",
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
                let token = TokenManager.getGenerateToken({
                  user: {
                    id: users[0].id_user,
                    username: users[0].username_user,
                    role: users[0].name_tu,
                  },
                });
                res.json({
                  status: "success",
                  message: "Login Success",
                  user: {
                    id: users[0].id_user,
                    username: users[0].username_user,
                    role: users[0].name_tu,
                  },
                  token,
                });
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

exports.currentUser = async (req, res) => {
  try {
    console.log(req.user);
    db.query(
      "SELECT id_user,username_user,name_tu FROM users,types WHERE username_user = ? AND type_user = id_tu",
      [req.user.username],
      (err, user) => {
        if (err) {
          user.json({ status: "error", message: "User not defined" });
          return;
        } else {
          res.send(user);
        }
      }
    );
  } catch (err) {
    console.log(err);
  }
};
