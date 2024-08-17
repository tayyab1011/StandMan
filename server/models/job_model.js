const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    users_customers_id: { type: String,},
    name: { type: String,  },
    job_date: { type: String, },
    start_time: { type: String,},
    end_time: { type: String, },
    special_instructions: { type: String,},
    image: { type: String, },
    status: { type: String, default: 'pending' },
})
module.exports = mongoose.model('Job',userSchema);