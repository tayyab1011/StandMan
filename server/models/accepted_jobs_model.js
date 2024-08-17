const mongoose = require('mongoose');


const acceptJobs = mongoose.Schema({
    jobs_id:{ type: String,},
    users_customers_id: { type: String,},
    status: { type: String, default: 'accepted' },
    name: { type: String },
    job_date: { type: String },
    start_time: { type: String },
    end_time: { type: String },
    special_instructions: { type: String },
    image: { type: String }

    
})
module.exports = mongoose.model('AcceptJobs',acceptJobs);