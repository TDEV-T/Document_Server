//config multer
const multer = require("multer");

const imageFilter = (req, file, cb) => {
  if (file.mimetype.startsWith("image")) {
    cb(null, true);
  } else {
    cb("Please Upload only images", false);
  }
};

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    const type = file.originalname.split(".");
    const typeExt = type[type.length - 1];
    cb(null, Date.now() + "__" + file.originalname);
  },
});

exports.upload = multer({ storage: storage, fileFilter: imageFilter });
