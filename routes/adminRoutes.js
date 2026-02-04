const express = require("express");
const router = express.Router();
const adminController = require("../controllers/adminController");
const auth = require("../middleware/auth");

/* Admin login */
router.post("/login", adminController.login);

/* ✅ Protected test route */
router.get("/dashboard", auth, (req, res) => {
  res.json({
    message: "Welcome admin",
    admin: req.admin
  });
});

module.exports = router;
