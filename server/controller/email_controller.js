const expressAsyncHandles = require('express-async-handler');
const dontenv = require('dotenv');
const nodemailer = require('nodemailer');
const OTP = require('../models/otp_model');
const generateOtp = require('../controller/otp_generator');
dontenv.config()


const transport = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: process.env.SMTP_PORT,
    auth: {
        user: process.env.SMTP_MAIL,
        pass: process.env.SMTP_PASSWORD

    }
})

const sendEmail = expressAsyncHandles(async (req, res) => {
    const { email } = req.body;


    const otp = generateOtp();
    const newOtp = new OTP({
        email,
        otp
    })
    await newOtp.save();
    var mailOptions = {
        from: process.env.SMTP_MAIL,
        to: email,
        subject: 'OTP from Tayyab',
        text: `Your OTP is : ${otp}`

    }
    transport.sendMail(mailOptions, (error, info) => {
        if (error) {
            res.status(500).json({
                message: error
            })
        }
        else {
            res.json(
                {
                    message: 'OTP sent Successfully',
                    otp: newOtp,
                    status: 'success',
                    code: 200

                }
            )
        }

    })


})

module.exports = { sendEmail };