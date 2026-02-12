const express = require("express");
const router = express.Router();
const controller = require("../controllers/serviceController");

router.get("/services", controller.getServices);
router.get("/services/:id", controller.getServiceById);

module.exports = router;
