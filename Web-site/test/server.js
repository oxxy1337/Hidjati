//test block
const api = 'http://cd6962d8.ngrok.io/user/login';
const userController = require('./controllers/user');
/////

const express = require('express');
const mongoose = require('mongoose');
const axios = require('axios');
const bodyParser = require('body-parser');
const path = require('path');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const fileStore = require('session-file-store')(session);

const app = express();

const auth = require('./middlewares/auth');

const connect = mongoose.connect('mongodb://localhost:27017/Product', {useNewUrlParser: true, useFindAndModify: false});

connect.then((db)=>{
    console.log('connected to the db');
});

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(session({
    name: 'session-id',
    secret: 'here we put the secret key',
    resave: false,
    saveUninitialized: false,
    store: new fileStore()
}));
app.use(auth.initialize);
app.use(auth.session);
app.use(auth.setUser);

app.use(express.static(__dirname + '/public'));
app.use('/css',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/css')));
app.use('/js',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/js')));
app.use('/js',express.static(path.join(__dirname,'/node_modules/bootstrap/jquery/dist')));

app.set('views','./views');
app.set('view engine','ejs');


app.get('/', (_, res) => {res.render('index')});

app.get('/Go',(_, res) => res.render('GuideOmra'));

app.get('/Gh',(_, res) => res.render('GuideHadj'));

app.route('/login')
.get((_, res)=> res.render('Login'))
.post(auth.logInUser);

app.get('/logout', userController.logout);

app.route('/register')
.get((_, res) => res.render('SignUp'))
.post(userController.create);

app.get('/test', (req, res)=>{res.json(req.user)});

app.listen(4000, 'localhost', ()=>{
    console.log('listening on port 4000')
});