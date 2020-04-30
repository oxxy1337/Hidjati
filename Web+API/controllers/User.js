const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const mailer = require('../middlewares/mailer');

const User = require('../models/pelerin');

module.exports = {
    createUser: (req, res, next)=>{
        User.findOne({email: req.body.email})
        .then((user)=>{
            if(!user)
                bcrypt.genSalt(10, (err, salt)=>{
                    bcrypt.hash(req.body.password, salt, (err, hash)=>{
                        req.body.password = hash;
                        User.create(req.body)
                        .then((user)=>{
                            mailer.sendEmailConfirmation(req, res, user);
                        });
                    });
                });
            else res.json({message:'user exist'});
        })
        .catch((err)=> next(err));
    },
    getUser: (req, res, next)=>{
        if(req.params.userId || req.query.id) User.findById(req.params.userId || req.query.id).then((user)=>{res.json(user)}).catch((err)=>next(err))
        else if(req.user.isAdmin){ 
            if(req.query.username) User.findOne({username: req.query.username}).then((user)=>{res.json(user)}).catch((err)=>next(err))
            else if(req.query.email) User.findOne({username: req.query.email}).then((user)=>{res.json(user)}).catch((err)=>next(err))
        }else 
            User.find({})
            .then((users)=>{
                res.json(users);
            });
    },
    deleteUser: (req, res, next)=>{
        if(req.params.userId) User.findByIdAndDelete(req.params.userId).then((user)=>{res.json(user)}).catch((err)=>next(err))
        else
        User.deleteMany({})
        .then((info)=>{
            res.json(info);
        });
    },
    redirectIfLoggedIn: (req, res, next)=>{
        if(req.user) return res.redirect('/');
        return next();
    },
    redirectIfNotLoggedIn: (req, res, next)=>{
        if(req.user) return next();
        return res.status(401).redirect('/user/login');
    },
    genTrackToken: (req, res, next)=>{
        jwt.sign({userId: req.user._id}, 'forgotthekey', (err, token)=>{
            res.json(token);
        });
    },
    logout: (req, res, next)=>{
        req.logOut();
        return res.status(200).json({message: 'logged out!'});
    }
}