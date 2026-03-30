const multer = require("multer");
const path = require("path");
const cloudinary = require("../config/cloudinary");

/* TEMP STORAGE (still needed) */
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/"); // temporary folder
  },
  filename: (req, file, cb) => {
    const uniqueName =
      Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(null, uniqueName + path.extname(file.originalname));
  }
});

const upload = multer({ storage });

/* Upload + Cloudinary */
exports.uploadSingle = [
  upload.single("file"),
  async (req, res, next) => {
    try {
      if (!req.file) {
        return res.status(400).json({ message: "No file uploaded" });
      }

      const result = await cloudinary.uploader.upload(req.file.path, {
        resource_type: "auto" // handles image + video
      });

      // attach cloudinary data to request
      req.cloudinaryUrl = result.secure_url;
      req.mediaType = result.resource_type;

      next(); // go to route
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }
];