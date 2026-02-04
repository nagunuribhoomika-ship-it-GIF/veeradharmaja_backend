const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth");
const { uploadSingle } = require("../controllers/mediaController");
const db = require("../config/db");

/* Upload media and link to event */
router.post("/upload/:eventId", auth, uploadSingle, (req, res) => {
  const { eventId } = req.params;
  const file = req.file;

  if (!file) {
    return res.status(400).json({ message: "No file uploaded" });
  }

  const type = file.mimetype.startsWith("video") ? "video" : "image";
  const filePath = `/uploads/${type}s/${file.filename}`;

  const query =
    "INSERT INTO media (event_id, type, file_path, status) VALUES (?, ?, ?, 'active')";

  db.query(query, [eventId, type, filePath], (err) => {
    if (err) {
      return res.status(500).json({ message: "Media save failed" });
    }

    res.json({
      message: "Media uploaded",
      filePath
    });
  });
});

// Public: get all media for an event
router.get("/event/:eventId", (req, res) => {
  const { eventId } = req.params;

  const query =
  "SELECT * FROM media WHERE event_id = ? AND status = 'active'";
   db.query(query, [eventId], (err, results) => {
    if (err) {
      return res.status(500).json({
        message: "Failed to fetch media"
      });
    }

    res.json(results);
  });
});

// Admin: soft delete media
router.delete("/:id", auth, (req, res) => {
  const { id } = req.params;

  const query = "UPDATE media SET status = 'deleted' WHERE id = ?";

  db.query(query, [id], (err) => {
    if (err) {
      return res.status(500).json({
        message: "Failed to delete media"
      });
    }

    res.json({ message: "Media deleted" });
  });
});

module.exports = router;
