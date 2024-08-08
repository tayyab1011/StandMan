const express = require('express');
const authRoutes = require("./routes/auth");
const jobRoutes = require('./routes/create_job');
const mongoose = require('mongoose');
const path = require('path')
const cors = require('cors')
const DB = "mongodb+srv://tayyabltd007:Tayyabawan933@cluster0.c5myzm4.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

const app = express();
const PORT = 3000;
//middleware
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use('/job_uploads', express.static(path.join(__dirname, 'job_uploads')));
app.use(express.json())
app.use(express.urlencoded({ extended: true }));
app.use(authRoutes);
app.use(jobRoutes);
app.use(cors());

mongoose.connect(DB).then(()=>{
    console.log('Connected to db');
})

app.listen(PORT,'0.0.0.0',() => {
    console.log('Hello world')

})