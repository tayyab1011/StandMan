const mongoose = require('mongoose');

const UserCustomerType = {
    TYPE_A: 'Customer',
    TYPE_B: 'Employee', // Add more types as needed
  };

const employeeSchema = mongoose.Schema({

    users_customers_type : {
        type: String,
        enum:Object.values(UserCustomerType),
        required:true,
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
    
      },
      documentId:{
        type:String 
      },
      proof:{
        type:String
      }

})
module.exports = mongoose.model("Employee",employeeSchema);