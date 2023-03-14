const TokenManager = require("./../functions/token/token_manager");

exports.auth = (req, res, next) => {
  try {
    const token = req.headers["authtoken"];

    let tokencheck = TokenManager.checkAuthentication(token);
    if (!tokencheck) {
      return res.status(401).send("Token Error !");
    } else {
      req.user = tokencheck.user;
      next();
    }
  } catch (err) {
    console.log(err);
    res.status(401).send("Token Invalid !");
  }
};
