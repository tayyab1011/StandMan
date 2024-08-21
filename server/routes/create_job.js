const express = require('express');
const multer = require('multer');
const path = require('path');
const Job = require('../models/job_model');
const AcceptJobs = require('../models/accepted_jobs_model');
const StartJobs = require('../models/start_job_model');
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
      data: [job]
    });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});
jobRoutes.post('/api/getJobs', async (req, res) => {
  try {
    const { users_customers_id } = req.body;
    const jobs = await Job.find({ users_customers_id });
    if (!jobs) {
      return res.status(404).json({ msg: 'No jobs found' });
    }
    res.status(200).json({
      code: 200,
      status: "success",
      data: jobs
    });

  } catch (error) {
    res.status(500).json({ error: error });
  }
})
jobRoutes.post('/api/acceptJobs', async (req, res) => {
  try {
    const { jobs_id, users_customers_id } = req.body;
    const jobs = await Job.findOne({ _id: jobs_id })
    if (!jobs) {
      return res.status(404).json({ msg: 'No jobs found' });
    }
    
    const acceptedJobs = await AcceptJobs.findOne({ jobs_id })
    if (acceptedJobs) {
      return res.status(404).json({ msg: 'Job is already Accepted' });
    }
    // const name = jobs.job_date;
    const newAcceptJobs = new AcceptJobs({
      jobs_id,
      users_customers_id,
      name: jobs.name,
      job_date: jobs.job_date,
      start_time: jobs.start_time,
      end_time: jobs.end_time,
      special_instructions: jobs.special_instructions,
      image: jobs.image

    });
    await newAcceptJobs.save();
  
    jobs.status = 'accepted'
    await jobs.save();
    res.status(200).json({ staus: "success", code: 200, data: newAcceptJobs });
  } catch (error) {
    res.status(500).json({ error: error });

  }
})
jobRoutes.post('/api/getAcceptedJobs', async (req, res) => {

  try {
    const { users_customers_id } = req.body;
  const getJobs = await AcceptJobs.find({ users_customers_id })
  if (!getJobs) {
    return res.status(404).json({ msg: 'No jobs found' });
  }
  res.status(200).json({
    code: 200,
    status: "success",
    data: getJobs
  });
  } catch (error) {
    res.status(500).json({ error: error });
  }

})
jobRoutes.post('/api/startjobs', async (req, res) => {
  try {
    const { users_customers_id, jobs_id, jobs_requests_id } = req.body;

    // Find the accepted job using the correct query
    const acceptedJob = await AcceptJobs.findOne({ jobs_id });

    // Check if the job is found
    if (!acceptedJob) {
      return res.status(404).json({ msg: 'No jobs found' });
    }

    // Check if the job is already started
    const ongoing = await StartJobs.findOne({ jobs_id });
    if (ongoing) {
      return res.status(400).json({ msg: 'Job is already started' });
    }

    // Create the new ongoing job
    const onGoingJob = new StartJobs({
      users_customers_id,
      jobs_requests_id,
      jobs_id,
      name: acceptedJob.name,
      job_date: acceptedJob.job_date,
      start_time: acceptedJob.start_time,
      end_time: acceptedJob.end_time,
      special_instructions: acceptedJob.special_instructions,
      image: acceptedJob.image
    });

    // Set the status to 'ongoing'
    onGoingJob.status = 'ongoing';

    // Save the job
    await onGoingJob.save();

    // Send success response
    res.status(200).json({
      code: 200,
      status: "success",
      data: onGoingJob
    });

  } catch (error) {
    // Handle errors
    res.status(500).json({ error: error.message });
  }
});
jobRoutes.post('/api/ongoingjobs', async (req, res)=>{
 try {
  const {users_customers_id} = req.body;
  const ongoingjobs = await StartJobs.find({users_customers_id});
  if(!ongoingjobs){
    return res.status(400).json({ msg: 'No Job found' });
  }
  res.status(200).json({
    code: 200,
    status: "success",
    data: ongoingjobs
  });
 } catch (error) {
  res.status(500).json({ error: error.message });
 }
})


module.exports = jobRoutes;
