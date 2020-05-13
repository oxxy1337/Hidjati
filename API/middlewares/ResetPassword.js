require('dotenv').config();

const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const mailer = require('./mailer');

const User = require('../models/pelerin');

module.exports = {
    resetPassEmail : (req, res, next)=>{
        User.findOne({email: req.body.email})
        .then((user)=>{
            if(!user) return res.status(404).json({succes: false, data: {}, message: 'there is no account registred with this email'})
            mailer.sendEmailResetPassword(req, res, user);
        })
        .catch(next);
    },
    resetPass: (req, res, next)=>{
        if(req.params.passToken)
        jwt.verify(req.params.passToken, process.env.RESETPASS_SECRET, (err, decoded)=>{
            
            if(err) return next(err);
            User.findById(decoded.userId)
            .then((user)=>{
                bcrypt.genSalt(10, (err, salt)=>{
                    bcrypt.hash(req.body.password, salt, (err, hash)=>{
                        user.password = hash;
                        user.save();
                        res.status(200).json({succes: true, data: user, message: 'Password has been reset'});
                    });
                });
            })
            .catch(next);
        })
        else
        res.status(404).json({sucess: false, data: {}, message: 'params missing'});     
    }
};
