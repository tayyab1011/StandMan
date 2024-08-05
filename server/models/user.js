const mongoose = require('mongoose');

const UserCustomerType = {
  TYPE_A: 'Customer',
  TYPE_B: 'Employee', // Add more types as needed
};

const userSchema = mongoose.Schema({
  user_customer_type: {
    type: String,
    enum: Object.values(UserCustomerType),
    required: true,
    trim: true,
  },

  first_name: {
    type: String,
    required: true,
    trim: true,
  },
  last_name: {
    type: String,
    required: true,
    trim: true,
  },
  phone: {
    type: Number,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    required: true,
    trim: true,
   
  },
  password: {
    type: String,
    required: true,
    trim: true,
  },
  confirm_password: {
    type: String,
    trim: true,
  },
  profile:{
    type:String

  }
  
});

module.exports = mongoose.model('User', userSchema);