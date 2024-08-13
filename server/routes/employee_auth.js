const express = require('express');
const Employee = require('../models/employee');
const bcrypt = require('bcryptjs');
const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './employee_uploads');
    },
    filename: function (req, file, cb) {
        cb(null, `${Date.now()}-${file.originalname}`);
    }
});



const uploads = multer({ storage: storage });
const employeeRoutes = express.Router();


employeeRoutes.post('/api/employee_sign_up', uploads.fields([
    { name: 'profile', maxCount: 1 },
    { name: 'documentId', maxCount: 1 },
    { name: 'proof', maxCount: 1 },
]), async (req, res) => {
    try {
        console.log('Request Body:', req.body);
        console.log('Request File:', req.file);
        const pic = req.file.path;
        const document = req.file.path;
        const proofs = req.file.path;
        const { users_customers_type, first_name, last_name, phone, email, password, confirm_password } = req.body;

        if (typeof password !== 'string' || typeof confirm_password !== 'string') {
            return res.status(400).json({ msg: 'Invalid password or confirm password' });
        }

        if (password !== confirm_password) {
            return res.status(400).json({ msg: 'Passwords do not match' });
        }
        const existingEmployee = await Employee.findOne({ email });
        if (existingEmployee) {
            return res.status(400).json({ msg: 'User Already exists' });
        }
        const hashedPassword = await bcrypt.hash(password,8);
        const confirmHashed = await bcrypt.hash(confirm_password,8);

        let employee = new Employee({
            users_customers_type,
            first_name,
            last_name,
            email,
            phone,
            password: hashedPassword,
            confirm_password: confirmHashed,
            profile: pic,
            documentId: document,
            proof: proofs

        });
        employee = await employee.save();
        res.status(200).json({
            code: 200,
            status: "success",
            data: employee
        });


    } catch (error) {
        return res.status(400).json({ error: error });

    }

})
module.exports = employeeRoutes;