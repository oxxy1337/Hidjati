const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { err } = require('../middlewares/Errorhandler');

const mailer = require('../middlewares/mailer');
const Admin = require('../models/admin');

const User = require('../models/pelerin');

module.exports = {
    createUser: (req, res, next)=>{
        User.findOne({email: req.body.email})
        .then((user)=>{
            if(!user)
                bcrypt.genSalt(10, (err, salt)=>{
                    bcrypt.hash(req.body.password, salt, (err, hash)=>{
                        req.body.password = hash;
                        User.create(req.body,(err, user)=>{
                            if(err) return next(err);
                            mailer.sendEmailConfirmation(req, res, user);
                        })
                    });
                });
            else res.status(400).json({succes:false, data: {}, message: "User exist"});
        })
        .catch(next);
    },
    getUser: (req, res, next)=>{
         if(req.params.userId || req.query.id) User.findById(req.params.userId || req.query.id).then((user)=>{let ruser = ({...user}._doc);delete ruser.password;res.status(200).json({succes:true, data: ruser, message: "user found"})}).catch(next)
         /*else if(req.user.isAdmin){ it was working now it is not xD
            if(req.query.username) User.findOne({username: req.query.username}).then((user)=>{res.status(200).json({succes:true, data: user, message: "user found"})}).catch(next)
            else if(req.query.email) User.findOne({email: req.query.email}).then((user)=>{res.status(200).json({succes:true, data: user, message: "user found"})}).catch(next)
        }*/ else 
            User.find({})
            .then((users)=>{
                users.map((user)=>{
                    let ruser = ({...user}._doc);
                    delete ruser.password;
                    return ruser;
                });
                res.status(200).json({succes:true, data: users, message: "all users"});
            })
            .catch(next);
    },
    deleteUser: (req, res, next)=>{
        if(req.params.userId) User.findByIdAndDelete(req.params.userId).then((user)=>{res.status(200).json({succes:true, data: user, message: "user deleted"})}).catch(next)
        /* else 
        User.deleteMany({})
        .then((info)=>{
            res.status(200).json({succes:true, data: info, message: "all users deleted"});
        })
        .catch(err); */
    },
    updateUser: (req, res, next)=>{
        User.findByIdAndUpdate(req.params.userId, {$set: req.body}, {returnNewDocument: true})
        .then((user)=>{
            let ruser = ({...user}._doc);
            delete ruser.password;
            res.status(200).json({succes:true, data: ruser, message: "user updated"});
        })
        .catch(next);
    },
    /* redirectIfLoggedIn: (req, res, next)=>{
        if(req.user) return res.redirect('/');
        return next();
    },
    redirectIfNotLoggedIn: (req, res, next)=>{
        if(req.user) return next();
        return res.status(401).redirect('/user/login');
    }, */
    genTrackToken: (req, res, next)=>{
        jwt.sign({userId: req.user._id}, 'forgotthekey', (err, token)=>{
            if(err) return next(err);
            res.json(token);
        });
    },
    logout: (req, res, next)=>{
        req.logOut();
        return res.status(200).json({succes: true, data:{}, message: 'logged out!'});
    }
};
