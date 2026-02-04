const db = require("../config/db");

/* CREATE EVENT (ADMIN ONLY) */
exports.createEvent = (req, res) => {
  const { name, description, slug } = req.body;

  if (!name || !slug) {
    return res.status(400).json({ message: "Name and slug are required" });
  }

  const query =
    "INSERT INTO events (name, description, slug, status) VALUES (?, ?, ?, 1)";

  db.query(query, [name, description, slug], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Error creating event" });
    }

    res.status(201).json({
      message: "Event created successfully",
      eventId: result.insertId
    });
  });
};

/* GET ALL EVENTS (PUBLIC – ONLY ACTIVE) */
exports.getAllEvents = (req, res) => {
  const query =
    "SELECT * FROM events WHERE status = 1 ORDER BY created_at DESC";

  db.query(query, (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Failed to load events" });
    }

    res.json(results);
  });
};

/* GET EVENT BY SLUG (PUBLIC) */
exports.getEventBySlug = (req, res) => {
  const { slug } = req.params;

  const query =
    "SELECT * FROM events WHERE slug = ? AND status = 1";

  db.query(query, [slug], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ message: "Event not found" });
    }

    res.json(results[0]);
  });
};

/* DELETE EVENT (ADMIN ONLY – SOFT DELETE) */
exports.deleteEvent = (req, res) => {
  const { id } = req.params;

  const query = "UPDATE events SET status = 0 WHERE id = ?";

  db.query(query, [id], (err) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Failed to delete event" });
    }

    res.json({ message: "Event deleted successfully" });
  });
};
