const mysql = require("mysql2");



exports.db = mysql.createConnection({
    user: "root",
    host: "localhost",
    database: "document",
});
