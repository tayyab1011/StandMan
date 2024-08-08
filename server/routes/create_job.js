const express = require('express');
const multer = require('multer');
const path = require('path');
const Job = require('../models/job_model');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './job_uploads');
  },
  filename: function (req, file, cb) {
    cb(null, `${Date.now()}-${file.originalname}`);
  }
});

const uploads = multer({ storage: storage });
const jobRoutes = express.Router();

jobRoutes.post('/api/createJob', uploads.single('image'), async (req, res) => {
  try {
    console.log('Request Body:', req.body);
    console.log('Request File:', req.file);
    // if (!req.file) {
    //   return res.status(400).json({ error: 'File not uploaded' });
    // }

   const pic = req.file.path;
    const { users_customers_id, name, job_date, start_time, end_time, special_instructions } = req.body;

    let job = new Job({
      users_customers_id,
      name,
      job_date,
      start_time,
      end_time,
      special_instructions,
      image: pic
    });

    await job.save();
    res.status(200).json({
      code: 200,
      status: "success",
      data: job
    });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = jobRoutes;
