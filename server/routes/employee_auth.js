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
        
        const { users_customers_type, first_name, last_name, phone, email, password, confirm_password } = req.body;

        if (typeof password !== 'string' || typeof confirm_password !== 'string') {
            return res.status(400).json({ msg: 'Invalid password or confirm password' });
        }

        if (password !== confirm_password) {
            return res.status(400).json({ msg: 'Passwords do not match' });
        }

        const existingEmployee = await Employee.findOne({ email });
        if (existingEmployee) {
            return res.status(400).json({ msg: 'User already exists' });
        }

        const hashedPassword = await bcrypt.hash(password, 8);
        const confirmHashed = await bcrypt.hash(confirm_password, 8);

        const employee = new Employee({
            users_customers_type,
            first_name,
            last_name,
            email,
            phone,
            password: hashedPassword,
            confirm_password: confirmHashed,
            profile: req.files['profile'][0].path,
            documentId: req.files['documentId'][0].path,
            proof: req.files['proof'][0].path
        });

        await employee.save();

        res.status(200).json({
            code: 200,
            status: "success",
            data: employee
        });

    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
});

employeeRoutes.post('/api/employee_signin',async(req,res)=>{
    try {
        const {email,password} = req.body;

    const data = await Employee.findOne({email});
    if(!data){
        return res.status(400).json({ msg: 'User Not Found' });
    }
    const verify = await bcrypt.compare(password,data.password);
    if(!verify){
        return res.status(400).json({message: 'Incorrect password'})   ; 
    }
    res.status(200).json({
        code: 200,
        status: "success",
        data: [data]
    });

    } catch (e) {
        res.status(500).json({message: e.message}); 
    }
})

module.exports = employeeRoutes;



