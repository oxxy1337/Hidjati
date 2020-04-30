require('dotenv').config();

const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const mailer = require('./mailer');

const User = require('../models/pelerin');

module.exports = {
    resetPassEmail : (req, res, next)=>{
        User.findOne({email: req.body.email})
        .then((user)=>{
            if(!user) return res.json({message: 'there is no account registred with this email'})
            mailer.sendEmailResetPassword(req, res, user);
        });
    },
    resetPass: (req, res, next)=>{
        if(req.params.passToken)
        jwt.verify(req.params.passToken, process.env.RESETPASS_SECRET, (err, decoded)=>{

            console.log(err);
            User.findById(decoded.userId)
            .then((user)=>{
                bcrypt.genSalt(10, (err, salt)=>{
                    bcrypt.hash(req.body.password, salt, (err, hash)=>{
                        user.password = hash;
                        user.save();
                        res.redirect('/');
                    });
                });
            })
            .catch((err)=>next(err));
        })
        else
        res.redirect('/');     
    }
}