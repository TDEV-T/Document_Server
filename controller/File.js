const { db } = require("../config/db");

exports.create_document = async (req, res) => {
  try {
    const data = req.body;
    let fileAll = "";

    for (let x = 0; x < req.files.length; x++) {
      fileAll += req.files[x].filename;
      if (x != req.files.length - 1) {
        fileAll += ",";
      }
    }

    db.query(
      "INSERT INTO file(header_file,start_file,end_file,content_file,file_file,own_file) VALUES (?,?,?,?,?,?)",
      [data.header, data.start, data.end, data.content, fileAll, data.own],
      (err, result) => {
        if (err) {
          res.json({ status: "error", message: err });
        } else {
          res.json({ status: "success", message: "Success Create Document" });
        }
      }
    );
  } catch (err) {
    console.log(err);
    res.status(401).send("Server Error !");
  }
};
