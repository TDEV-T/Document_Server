const jwt = require("jsonwebtoken");
const tokenData = require("./token_data.json");

class TokenManager {
  static getGenerateToken(payload) {
    return jwt.sign(payload, tokenData["secret_key"], { expiresIn: "3000s" });
  }

  static checkAuthentication(token) {
    try {
      let jwtRespone = jwt.verify(String(token), tokenData["secret_key"]);
      return jwtRespone;
    } catch (error) {
      return false;
    }
  }

  static getSecret() {
    return require("crypto").randomBytes(64).toString("hex");
  }
}

module.exports = TokenManager;
