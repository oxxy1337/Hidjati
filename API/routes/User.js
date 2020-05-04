const express = require('express');

const uController = require('../controllers/User');

const User = require('../models/pelerin');

const auth = require('../middlewares/auth');
const validator = require('../middlewares/validation');

const userRouter = express.Router();

userRouter.route('/register')
//.all(uController.redirectIfLoggedIn)
.post(validator.registerValidation, uController.createUser);

userRouter.route('/login')
//.all(uController.redirectIfLoggedIn)
.post(validator.loginValidation, auth.logInUser)
.get((req, res, next)=>{
    res.status(200).json({message: 'log in!'});
});

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

module.exports = userRouter;
