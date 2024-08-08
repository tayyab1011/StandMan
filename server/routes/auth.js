const express = require('express');
const User = require('../models/user');
const bcrypt = require('bcryptjs');
const multer = require('multer');
const path = require('path');
const {sendEmail} = require("../controller/email_controller");
const jwt = require('jsonwebtoken');
const { resetPassword } = require('../controller/reset_password_controller');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './uploads');
  },
  filename: function (req, file, cb) {
    cb(null, `${Date.now()}-${file.originalname}`);
  }
});

const uploads = multer({ storage: storage });
const authRoutes = express.Router();

authRoutes.post('/api/signup', uploads.single("profile"), async (req, res) => {
  try {
    console.log('Request Body:', req.body);
    console.log('Request File:', req.file);
    const pic = req.file.path;

    if (!req.file) {
      throw new Error('No file uploaded');
    }

    const { user_customer_type, first_name, last_name, phone, email, password, confirm_password } = req.body;

    console.log('Password:', password);
    console.log('Confirm Password:', confirm_password);

    if (typeof password !== 'string' || typeof confirm_password !== 'string') {
      throw new Error('Invalid password or confirm password');
    }

    if (password !== confirm_password) {
      throw new Error('Passwords do not match');
    }

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: 'User Already exists' });
    }

    const hashedPassword = await bcrypt.hash(password, 8);
    const confirmHashed = await bcrypt.hash(confirm_password, 8);


    let user = new User({
      user_customer_type,
      first_name,
      last_name,
      email,
      phone,
      password: hashedPassword,
      confirm_password: confirmHashed,
      profile: pic
    });
    console.log('User object before save:', user);
    user = await user.save();
    console.log('User saved:', user);
    res.status(200).json({
      code: 200,
      status: "success",
      data: user
    });
  } catch (e) {
    console.error('Error:', e);
    res.status(500).json({ error: e.message });
  }
});

//sign in api
authRoutes.post('/api/signIn',async(req,res) => {
  try{
      const {email,password} = req.body;
      const user =await User.findOne({email});
  if(!user){
      return res.status(400).json({message: 'User not found'});
  }
  const isMatch = await bcrypt.compare(password,user.password);
  if(!isMatch){
      return res.status(400).json({message: 'Incorrect password'})   ; 
  }
  const token = jwt.sign({id: user._id},'secret123');
  res.json({ status: 'success', token, data:[user]});
  }
  catch(e){
      res.status(500).json({message: e.message});
 }
});

authRoutes.post('/api/sendOtp',sendEmail)

authRoutes.post('/api/resetpassword',resetPassword);

module.exports = authRoutes;
