const serviceModel = require("../models/serviceModel");


// ✅ GET all services
exports.getServices = (req, res) => {
  serviceModel.getAllServices((err, result) => {
    if (err) return res.status(500).json(err);

    res.json(result);
  });
};


// ✅ GET service details + features
exports.getServiceById = (req, res) => {
  const id = req.params.id;

  serviceModel.getServiceById(id, (err, rows) => {
    if (err) return res.status(500).json(err);

    if (!rows.length) {
      return res.status(404).json({ message: "Service not found" });
    }

    // convert SQL rows into structured object
    const service = {
      id: rows[0].id,
      title: rows[0].title,
      description: rows[0].description,
      image: rows[0].image,
      features: rows.map((r) => r.feature).filter(Boolean)
    };

    res.json(service);
  });
};
