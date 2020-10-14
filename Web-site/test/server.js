//test block
const api = 'http://localhost:3000/';
const userController = require('./controllers/user');
/////
const axios = require('axios');
const express = require('express');
const mongoose = require('mongoose');
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
    cookie: {
        maxAge: 60*10000
      },
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


app.route('/')
.get((req, res) => {
    if(!req.user) return res.render('index');
    return res.render('home', {data: req.user});
});

app.route('/profile')
.all(userController.redirectIfNotLoggedIn)
.get((_, res) => res.render('Profile'));

app.route('/advices')
.all(userController.redirectIfNotLoggedIn)
.get((_, res) => res.render('Advices'));

app.route('/places')
.get((req, res, next)=>{
    axios({
        method: 'get',
        url: api+'place'
    })
    .then((resp)=>{
        res.render('places', {data: resp.data})
    })
    .catch(()=>{
        res.render('Agencies', {data: null});
    });
});


app.route('/loc')
.get((_, res) => res.render('places'));
app.route('/dashboard')
.get((_, res) => res.render('./Admin/index'));
app.route('/in2')
.get((_, res) => res.render('./Admin/index2'));
app.route('/in3')
.get((_, res) => res.render('./Admin/index3'));
app.route('/in4')
.get((_, res) => res.render('./Admin/index4'));
app.route('/admin')
.get((_, res) => res.render('./Admin/login'));

app.route('/Gh')
.get((_, res) => res.render('GuideHadj'));
app.route('/Go')
.get((_, res) => res.render('GuideOmra'));

app.route('/init')
.all(userController.redirectIfNotLoggedIn, (req, res, next)=>{if(req.user.type) return res.redirect('/'+req.user.type);next()})
.get((_, res) => res.render('init'));

app.route('/initDone')
.all((req, res, next)=>{
    user = req.user;
    user = req.body.user;
    req.login(user, (err)=>{
        res.locals.user = user;
        res.json({success: true});
    })    
});


app.route('/ifrad')
.all(userController.redirectIfNotLoggedIn, userController.isInit)
.get((_, res) => res.render('./UserHadj/Ifrad'));

app.route('/ikran')
.all(userController.redirectIfNotLoggedIn, userController.isInit)
.get((_, res) => res.render('./UserHadj/I9ran'));

app.route('/tama')
.all(userController.redirectIfNotLoggedIn, userController.isInit)
.get((_, res) => res.render('./UserHadj/Tamato3'));

app.route('/omra')
.all(userController.redirectIfNotLoggedIn, userController.isInit)
.get(userController.isInit, (_, res) => res.render('UserOmra'));

app.route('/agencies')
.get((req, res, next)=>{
    axios({
        method: 'get',
        url: api+'agency'
    })
    .then((resp)=>{
        res.render('Agencies', {data: resp.data});
    })
    .catch(()=>{
        res.render('Agencies', {data: null});
    });
});

app.route('/agency/:agencyId')
.get((req, res, next)=>{
    //console.log(api+'agency/'+ req.params.agencyId);
    axios({
        method: 'get',
        url: api+'agency/'+ req.params.agencyId
    })
    .then((resp)=>{
        res.render('agency', {data: resp.data});
    })
    .catch(()=>{
        res.render('Agencies', {data: null});
    });
});

app.route('/agency')
.get((_, res) => res.redirect('/agencies'))

app.route('/login')
.all(userController.redirectIfLoggedIn)
.get((_, res)=> res.render('Login'))
.post(auth.logInUser);

app.route('/logout')
.all(userController.redirectIfNotLoggedIn)
.get(userController.logout);

app.route('/register')
.all(userController.redirectIfLoggedIn)
.get((_, res) => res.render('SignUp'))
.post(userController.create);

app.route('/passwdreset')
.all(userController.redirectIfLoggedIn)
.get((_, res) => res.render('passwdreset'));
//.post(userController.create);

app.route('/forgetpasswd')
.get((_, res) => res.render('forgetpasswd'))

app.route('/feedback')
.get((_, res) => res.render('feedback'))

app.route('/error')
.get((_, res) => res.render('error'));

app.route('/nav')
.get((_, res) => res.render('navbar'));

app.route('/nav2')
.get((_, res) => res.render('navbar2'));

app.route('/nav3')
.get((_, res) => res.render('navbar3'));

app.route('/prfsettings')
.get((_, res) => res.render('prfsettings'));

app.get('/test', (req, res)=>{res.json(req.user)});

app.listen(4000, 'localhost', ()=>{
    console.log('listening on port 4000')
});
