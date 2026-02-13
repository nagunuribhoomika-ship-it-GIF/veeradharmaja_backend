const express = require("express");
const router = express.Router();
const db = require("../config/db");

router.get("/admin/enquiries", (req, res) => {
  const sql = "SELECT * FROM enquiries ORDER BY created_at DESC";

  db.query(sql, (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).json([]);
    }
    res.json(result);
  });
});

module.exports = router;
