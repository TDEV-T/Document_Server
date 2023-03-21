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
      "INSERT INTO file(header_file,location_file,start_file,end_file,content_file,file_file,own_file) VALUES (?,?,?,?,?,?,?)",
      [
        data.header,
        data.location,
        data.start,
        data.end,
        data.content,
        fileAll,
        data.own,
      ],
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

exports.get_document = async (req, res) => {
  try {
    db.query(
      "SELECT `id_file`,`header_file`,`content_file`,`file_file`,`own_file`,`timestamp_file`, DATE_FORMAT(start_file, '%Y/%m/%d') as start_file,DATE_FORMAT(end_file, '%Y/%m/%d') as end_file FROM file WHERE own_file = ?",
      [req.body.userid],
      (err, result) => {
        if (err) {
          res.json({ status: "error", message: err });
        } else {
          console.log(result);
          res.send(result);
        }
      }
    );
  } catch (err) {
    console.log(err);
    res.status(401).send("Server Error");
  }
};
