require('dotenv').config();

const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const cookieParser = require('cookie-parser');
const session = require('express-session');
// const fileStore = require('session-file-store')(session);
const fs = require('fs'); 

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

const connect = mongoose.connect(process.env.DB_URL, {useNewUrlParser: true, useFindAndModify: false});

connect.then((db)=>{
    console.log("connected succefully to the db");
});

const app = express();

app.use(bodyParser.json());
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

app.get('/', (req, res, next)=>{
    res.json({a: req.session, b: req.user, c: res.locals})
});

app.use('/track', trackRouter);
app.use('/confirmation', confirmationRouter);
app.use('/user', userRouter);
app.use('/agency', agencyRouter);
app.use('/place', placeRouter);
app.use('/feedbacks', feedbackRouter);
app.use('/admin', adminRouter);
app.use('/resetpassword', resetpassRouter);

app.use(handler.notFound,handler.err);

module.exports = app;