const otpGenerator = require('otp-generator');

const generateOtp = () => {
    const OTP = otpGenerator.generate(4, {
        lowerCaseAlphabets: false,
        upperCaseAlphabets: false,
        digits: true,
        specialChars: false
    })
    return OTP;
}
module.exports = generateOtp;