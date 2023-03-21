const fs = require("fs");

exports.image = async (req, res) => {
  try {
    const fileName = req.params.fileName;
    const filePath = "uploads/" + fileName;
    const imagebuffer = fs.readFileSync(filePath);
    res.set("Content-Type", "image/jpeg");
    res.send(imagebuffer);
  } catch (err) {
    res.send(err);
  }
};
