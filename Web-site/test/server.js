require('dotenv').config();

//test block
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
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const User = require('./models/user');
const app = express();


const auth = require('./middlewares/auth');
const reset = require('./middlewares/resetPass');

const connect = mongoose.connect(process.env.DB_URL, {useNewUrlParser: true, useFindAndModify: false});

connect.then((db)=>{
    console.log('connected to the db');
});

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(session({
    name: 'session-id',
    secret: process.env.SESSION_SECRET,
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
    return res.redirect('/home');
});

app.route('/profile')
.all(userController.redirectIfNotLoggedIn)
.get((_, res) => res.render('Profile'));

app.route('/advices')
.all(userController.redirectIfNotLoggedIn)
.get((_, res) => res.render('Advices'));

app.route('/places')
.get((req, res, next)=>{
    console.log(process.env.API_URL+'/place');
    axios({
        method: 'get',
        url: process.env.API_URL+'/place',
        headers: {
            'apikey':'123456789'
        }
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
        url: process.env.API_URL+'/agency',
        headers: {
            'apikey':'123456789'
        }
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
        url: process.env.API_URL+'/agency/'+ req.params.agencyId,
        headers: {
            'apikey':'123456789'
        }
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

app.route('/home')
.all(userController.redirectIfNotLoggedIn, userController.isInit)
.get((_, res)=> res.render('home'))

app.route('/logout')
.all(userController.redirectIfNotLoggedIn)
.get(userController.logout, (req, res, next)=>{
    res.render('Login');
});

app.route('/confirmation/:token')
.get(async (req, res, next)=>{
    const id = await jwt.verify(req.params.token, process.env.CONFIRMATION_SECRET).userId;
        User.findById(id)
        .then(async (user)=>{
            if(user){
                if(!user.confirmed){
                    user.confirmed = true;
                    await user.save({ validateBeforeSave: false });
                    res.render('Login');
                }
            }
        })
        .catch(next);
    }
);

app.route('/register')
.all(userController.redirectIfLoggedIn)
.get((_, res) => res.render('SignUp'))
.post(userController.create);

app.route('/resetpassword/:passToken')
.all(userController.redirectIfLoggedIn)
.get((_, res) => res.render('passwdreset'))
.post(reset.resetPass, (req, res, next)=>{
    console.log("here");
    res.render('passwdreset');
});

//.post(userController.create);

app.route('/forgetpasswd')
.get((req, res) => res.render('forgetpasswd'))
.post((req, res, next)=> {
    axios.post(process.env.API_URL+'/resetpassword',
        {
            email: req.body.email
        },
        {
        headers: {
            'apikey':'123456789'
        }
    }
    )
    .then((resp)=>{
         res.render('forgetpasswd', resp);                   //here front
    })
    .catch((err)=>{res.render('error', err)});
});

app.route('/feedback')
.get((_, res) => res.render('feedback'))
.post((_, res)=> {
    axios({
        method: 'post',
        url: process.env.API_URL + '/feedback',
        data: {
            _id: res.locals.user,
            subject: req.body.subject,
            note: req.body.note,
            content: req.body.content
        },
        headers: {
            'apikey':'123456789'
        }
    })
    .then(resp=>{
        res.render('feedback', {resp});
    })
});

app.use((_, res) => res.render('error'));

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
