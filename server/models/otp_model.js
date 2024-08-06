const mongoose = require('mongoose');

const OtpSchema = mongoose.Schema({
    email: {
        type: String,
        required: true,
      },
      otp: {
        type: String,
        required: true,
      },
      createdAt:{
        type:Date,
        default:Date.now,
        expire:300,

      }
})

module.exports = mongoose.model('OTP',OtpSchema);