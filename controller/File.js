const { db } = require("../config/db");

exports.create_document = async (req, res) => {
  try {
    const data = req.body;

    console.log(data);

    let idReport;
    // let fileAll = "";

    // for (let x = 0; x < req.files.length; x++) {
    //   fileAll += req.files[x].filename;
    //   if (x != req.files.length - 1) {
    //     fileAll += ",";
    //   }
    // }

    db.query(
      "INSERT INTO `reports`( `start_re`, `activity_re`, `project_re`, `another_re`, `dev_re`, `manage_re`, `plans_re`, `college_re`, `group_re`, `work_re`, `dept_re`, `location_re`, `name_re`, `benefit_re`, `comment_re`, `own_re`, `img_re`, `result_re`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
      [
        data.start_re,
        data.activity_re,
        data.project_re,
        data.another_re,
        data.dev_re,
        data.manage_re,
        data.plans_re,
        data.college_re,
        data.group_re,
        data.work_re,
        data.dept_re,
        data.location_re,
        data.name_re,
        data.benefit_re,
        data.comment_re,
        data.own_re,
        "",
        data.result_re,
      ],
      (err, result) => {
        if (err) {
          res.json({ status: "error", message: err });
          return;
        } else {
          idReport = result.insertId;

          // for (let i = 0; i < data.part.length; i++) {
          //   console.log(data.part);
          // }
          let resultPart = JSON.parse(data.part);
          for (let i = 0; i < resultPart.length; i++) {
            const obj = resultPart[i];
            const query = `INSERT INTO participant (re_pa, name_pa,value_pa) VALUES ('${idReport}','${obj.name}','${obj.count}')`;
            db.query(query, (err, result) => {
              if(err) throw err;
            });
          }

          res.json({status:"success",message:"Create Success !"});
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
          res.send(result);
        }
      }
    );
  } catch (err) {
    console.log(err);
    res.status(401).send("Server Error");
  }
};
