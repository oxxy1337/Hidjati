const express = require('express');

const uController = require('../controllers/User');

const User = require('../models/pelerin');

const auth = require('../middlewares/auth');
const validator = require('../middlewares/validation');

const userRouter = express.Router();

userRouter.use((req, res, next)=>{ //forgot the password + next()
    if(!req.body && req.data) {
        req.body.username = req.data.username;
        req.body.password = req.data.password;
        req.body.email = req.data.email;
        req.body.gender = req.data.gender;
    };
    next();
})

//the api did respond to the axios request with the created user

userRouter.route('/register')
//.all(uController.redirectIfLoggedIn)
.post(/* validator.registerValidation, */ uController.createUser);

userRouter.route('/logout')
//.all(uController.redirectIfNotLoggedIn)
.get(uController.logout);

userRouter.route('/')
.all((req, res, next)=>{
    User.find({})
    .then((user)=>{
        res.json({user, type: user.constructor.name});
    });
});

userRouter.route('/delete/userId')
.delete(uController.deleteUser);

userRouter.post('/mobilelogin', auth.loginMobile);

module.exports = userRouter;
