require('dotenv').config();

const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const cookieParser = require('cookie-parser');
const session = require('express-session');
// const fileStore = require('session-file-store')(session);
const fs = require('fs'); 
const cors = require('cors');

const upload = require('./middlewares/upload');
const auth = require('./middlewares/auth');
const handler = require('./middlewares/Errorhandler');

const userRouter = require('./routes/User');
const confirmationRouter = require('./routes/Confirmation');
const agencyRouter = require('./routes/Agency');
const placeRouter = require('./routes/Place');
const adminRouter = require('./routes/Admin');
const trackRouter = require('./routes/Track');
const resetpassRouter = require('./routes/ResetPassword');
const feedbackRouter = require('./routes/Feedback');
const initRouter = require('./routes/InitUpdate');

const connect = mongoose.connect(process.env.DB_URL, {useNewUrlParser: true, useFindAndModify: false});

const app = express();

/* app.use((req, res, next)=>{
    if(req.headers['apikey'] != process.env.API_KEY) return res.status(404).json({succes: false,data:{}, msg:"not auth"})
    next();
}); */
/* 
app.use((req, res, next)=>{
    console.log(req.body);
    next();
}) */

connect.then((db)=>{
    console.log("connected succefully to the db");
});

app.use(bodyParser.json({limit:'50mb'}));
app.use(bodyParser.urlencoded({extended: true}));
//app.use('/uploads', express.static(__dirname+'/public'));
app.use(morgan('common', {stream: fs.createWriteStream('./access.log', {flags: 'a'})}));
app.use(cookieParser());
app.use(session({
    name: 'session-id',
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    // store: new fileStore({})
}));
app.use(auth.initialize);
app.use(auth.session);
app.use(auth.setUser);
/* 
app.post('/test', upload.single('name'), (req, res, next)=>{
    res.redirect('/'+req.file.filename);
});
 */


// Add headers
app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

app.use('/track', trackRouter);
app.use('/confirmation', confirmationRouter);
app.use('/user', userRouter);
app.use('/agency', agencyRouter);
app.use('/place', placeRouter);
app.use('/feedbacks', feedbackRouter);
app.use('/admin', adminRouter);
app.use('/resetpassword', resetpassRouter);
app.use('/init', initRouter);

app.use(handler.notFound,handler.err);

module.exports = app;