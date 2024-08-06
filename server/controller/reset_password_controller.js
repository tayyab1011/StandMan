const expressAsyncHandler = require('express-async-handler');
const bcrypt = require('bcryptjs');
const User = require('../models/user'); // Update with the correct path to your User model
const { use } = require('../routes/auth');


const resetPassword = expressAsyncHandler(async (req, res) => {
  const { email,newPassword, confirmPassword } = req.body;

  if (typeof newPassword !== 'string' || typeof confirmPassword !== 'string') {
    throw new Error('Invalid password or confirm password');
  }

  if (newPassword !== confirmPassword) {
    return res.status(400).json({ msg: 'Passwords do not match' });
  }

  const user = await User.findOne({ email });
  if (!user) {
    return res.status(400).json({ msg: 'User not found' });
  }

  const hashedPassword = await bcrypt.hash(newPassword, 8);
  user.password = hashedPassword;
  await user.save();

  res.status(200).json({ msg: 'Password has been reset successfully' ,status:'success',data:user});
});

module.exports = { resetPassword };
