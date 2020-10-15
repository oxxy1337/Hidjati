require('dotenv').config();

const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const User = require('../models/user');

module.exports = {
    resetPass : (req, res, next)=>{
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
                        await user.save({validateBeforeSave: false});
                        let ruser = ({...user}._doc);
                        delete ruser.password;
                        next();
                    });
                });
            })
            .catch(next);
        })
    }
}