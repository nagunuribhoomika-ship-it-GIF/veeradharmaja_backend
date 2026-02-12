const db = require("../config/db");


// ✅ Get all services (for cards page)
exports.getAllServices = (callback) => {
  const query = "SELECT * FROM services ORDER BY id DESC";

  db.query(query, callback);
};


// ✅ Get service + features (for details page)
exports.getServiceById = (id, callback) => {
  const query = `
    SELECT s.id, s.title, s.description,s.image, f.feature
    FROM services s
    LEFT JOIN service_features f
    ON s.id = f.service_id
    WHERE s.id = ?
  `;

  db.query(query, [id], callback);
};
