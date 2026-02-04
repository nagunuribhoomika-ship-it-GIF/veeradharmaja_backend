const multer = require("multer");
const path = require("path");

/* STORAGE CONFIG */
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    if (file.mimetype.startsWith("video")) {
      cb(null, "uploads/videos");
    } else {
      cb(null, "uploads/images");
    }
  },
  filename: (req, file, cb) => {
    const uniqueName =
      Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(null, uniqueName + path.extname(file.originalname));
  }
});

const upload = multer({ storage });

exports.uploadSingle = upload.single("file");
