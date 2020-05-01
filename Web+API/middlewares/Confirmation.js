require('dotenv').config();

const jwt = require('jsonwebtoken');

const User = require('../models/pelerin');
const Admin = require('../models/admin');

module.exports = {
    confirmAccount : (req, res, next)=>{
        const id = jwt.verify(req.params.token, process.env.CONFIRMATION_SECRET).userId;
        User.findById(id)
        .then((user)=>{
            if(user){
                if(!user.confirmed){
                    user.confirmed = true;
                    user.save();
                }
            }else
            Admin.findById(id)
            .then((admin)=>{
                if(admin){
                    if(!admin.confirmed){
                        admin.confirmed = true;
                        admin.save();
                    }
                }
            })
        })
        .catch(next);
        res.redirect('/');
    }
};