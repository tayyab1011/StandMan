const mongoose = require('mongoose');


const startJobs = mongoose.Schema({
    jobs_id: { type: String, },
    jobs_requests_id: {
        type: String,

    },
    users_customers_id: { type: String, },
    status: { type: String, default: 'ongoing' },
    name: { type: String },
    job_date: { type: String },
    start_time: { type: String },
    end_time: { type: String },
    special_instructions: { type: String },
    image: { type: String }

})
module.exports = mongoose.model('StartJobs', startJobs);