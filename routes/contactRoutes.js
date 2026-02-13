const express = require("express");
const router = express.Router();
const nodemailer = require("nodemailer");
const db = require("../config/db");


router.post("/contact", (req, res) => {
  const { name, phone, occasion, date, message } = req.body;

  // 1️⃣ Save to MySQL
  const sql = `
    INSERT INTO enquiries (name, phone, occasion, event_date, message)
    VALUES (?, ?, ?, ?, ?)
  `;

  db.query(sql, [name, phone, occasion, date, message], async (err) => {
    if (err) {
      console.log("DB error:", err);
      return res.status(500).json({ success: false });
    }

    try {
      // 2️⃣ Send Email
      const transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
          user: process.env.EMAIL_USER,
          pass: process.env.EMAIL_PASS,
        },
      });

      await transporter.sendMail({
        from: process.env.EMAIL_USER,
        to: process.env.EMAIL_USER,
        subject: "New Event Enquiry",
        text: `
Name: ${name}
Phone: ${phone}
Occasion: ${occasion}
Event Date: ${date}
Message: ${message}
        `,
      });

      res.status(200).json({ success: true });
    } catch (error) {
      console.log("Email error:", error);
      res.status(500).json({ success: false });
    }
  });
});


module.exports = router;
