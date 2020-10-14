require('dotenv').config();

const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const mailer = require('./mailer');

const User = require('../models/pelerin');
const Admin = require('../controllers/Admin');

const Adminn = require('../models/admin');

module.exports = {
    resetPassEmail : (req, res, next)=>{
        User.findOne({email: req.body.email})
        .then((user)=>{
            if(user) mailer.sendEmailResetPassword(req, res, user)
            else 
            Adminn.findOne({email: req.body.email})
            .then((admin)=>{
                if(admin) mailer.sendEmailResetPassword(req, res, admin);
                else res.status(404).json({succes: false, data: {}, message: 'there is no account registred with this email'});
            })
            })
        .catch(next);
}
    ,
    resetPass: (req, res, next)=>{
        if(req.params.passToken)
        jwt.verify(req.params.passToken, process.env.RESETPASS_SECRET, (err, decoded)=>{
            if(err) return next(err);
            User.findById(decoded.userId)
            .then((user)=>{
                if(user)
                bcrypt.genSalt(10, (err, salt)=>{
                    bcrypt.hash(req.body.password, salt, async(err, hash)=>{
                        if(err) return res.status(500).json({succes: false, message:"something went wrong"});
                        user.password = hash;
                        await user.save({validateBeforeSave: false });
                        let ruser = ({...user}._doc);
                        delete ruser.password;
                        res.status(200).json({succes: true, data: ruser, message: 'Password has been reset'});
                    });
                });
                else
                Adminn.findById(decoded.userId)
                .then((admin)=>{
                    if(admin)
                    bcrypt.genSalt(10, (err, salt)=>{
                        bcrypt.hash(req.body.password, salt, async (err, hash)=>{
                            console.log(admin);
                            admin.password = hash;
                            await admin.save({validateBeforeSave: false });
                            console.log(admin);
                            let radmin = ({...admin}._doc);
                            delete radmin.password;
                            res.status(200).json({succes: true, data: radmin, message: 'password has been rest'});
                        })
                    })
                    else res.status(404).json({succes: false, data:{}, message: 'Wrong token'});
                })
                .catch(next);
            })
            .catch(next);
        })
        else
        res.status(404).json({sucess: false, data: {}, message: 'params missing'});     
    }
};
