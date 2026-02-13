const express = require("express");
const cors = require("cors");
const path = require("path"); // ✅ REQUIRED
require("dotenv").config();

const adminRoutes = require("./routes/adminRoutes");
const eventRoutes = require("./routes/eventRoutes");
const mediaRoutes = require("./routes/mediaRoutes");
const serviceRoutes= require("./routes/serviceRoutes");
const contactRoutes = require("./routes/contactRoutes");
const adminEnquiryRoutes = require("./routes/adminEnquiryRoutes");


const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// 🔥 THIS LINE WAS MISSING IN server.js
app.use("/uploads", express.static(path.join(__dirname, "uploads")));

// routes
app.use("/api/admin", adminRoutes);
app.use("/api/events", eventRoutes);
app.use("/api/media", mediaRoutes);
app.use("/api", serviceRoutes);
app.use("/api", contactRoutes);
app.use("/api", adminEnquiryRoutes);
app.use(
  "/images",
  express.static(path.join(__dirname, "public/images"))
);
app.get("/", (req, res) => {
  res.send("Backend is running 🚀");
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`✅ Server running on port ${PORT}`);
});
