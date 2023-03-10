const jwt = require("jsonwebtoken");
const tokenData = require('./token_data.json');


class TokenManager{
    static getGenerateToken(payload){
        return jwt.sign(payload,tokenData["secret_key"],{"expiresIn":"3000s"});
    }

    static checkAuthentication(request){
        try{
            let accessToken = request.headers.authorization.split(" ")[1];
            let jwtRespone = jwt.verify(String(accessToken),tokenData["secret_key"]);
            return jwtRespone;
        }
        catch(error){
            return false;
        }
    }

    static getSecret(){
        return require("crypto").randomBytes(64).toString("hex");
    }
}


module.exports = TokenManager;