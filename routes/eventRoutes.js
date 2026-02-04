const express = require("express");
const router = express.Router();
const db = require("../config/db");
const auth = require("../middleware/auth");

/* ---------------------------------------------------
   PUBLIC: Get all active events (cards page)
   GET /api/events
--------------------------------------------------- */
router.get("/", (req, res) => {
  const query =
    "SELECT id, name, slug FROM events WHERE status = 1 ORDER BY id DESC";

  db.query(query, (err, results) => {
    if (err) {
      return res.status(500).json({
        message: "Failed to fetch events"
      });
    }

    res.json(results);
  });
});

/* ---------------------------------------------------
   ADMIN: Create new event
   POST /api/events
--------------------------------------------------- */
router.post("/", auth, (req, res) => {
  const { name } = req.body;

  if (!name) {
    return res.status(400).json({
      message: "Event name is required"
    });
  }

  const slug = name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "");

  const query =
    "INSERT INTO events (name, slug, status) VALUES (?, ?, 1)";

  db.query(query, [name, slug], (err, result) => {
    if (err) {
      return res.status(500).json({
        message: "Failed to create event"
      });
    }

    res.json({
      id: result.insertId,
      name,
      slug
    });
  });
});

/* ---------------------------------------------------
   PUBLIC: Get event by slug
   GET /api/events/slug/:slug
--------------------------------------------------- */
router.get("/slug/:slug", (req, res) => {
  const { slug } = req.params;

  const query =
    "SELECT id, name, slug FROM events WHERE slug = ? AND status = 1 LIMIT 1";

  db.query(query, [slug], (err, results) => {
    if (err) {
      return res.status(500).json({
        message: "Failed to fetch event"
      });
    }

    if (results.length === 0) {
      return res.status(404).json({
        message: "Event not found"
      });
    }

    res.json(results[0]);
  });
});

/* ---------------------------------------------------
   ADMIN: Soft delete event
   DELETE /api/events/:id
--------------------------------------------------- */
router.delete("/:id", auth, (req, res) => {
  const { id } = req.params;

  const query = "UPDATE events SET status = 0 WHERE id = ?";

  db.query(query, [id], (err) => {
    if (err) {
      return res.status(500).json({
        message: "Failed to delete event"
      });
    }

    res.json({
      message: "Event deleted successfully"
    });
  });
});

module.exports = router;
