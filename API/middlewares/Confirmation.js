require('dotenv').config();

const jwt = require('jsonwebtoken');

const User = require('../models/pelerin');
const Admin = require('../models/admin');

module.exports = {
    confirmAccount : (req, res, next)=>{
        var resp;
        const id = jwt.verify(req.params.token, process.env.CONFIRMATION_SECRET).userId;
        User.findById(id)
        .then((user)=>{
            if(user){
                let ruser = ({...user}._doc);
                delete ruser.password;
                resp = ruser;
                if(!user.confirmed){
                    user.confirmed = true;
                    user.save();
                }
            }else
            Admin.findById(id)
            .then((admin)=>{
                if(admin){
                    let radmin = ({...admin}._doc);
                    delete radmin.password;
                    resp = radmin;
                    if(!admin.confirmed){
                        admin.confirmed = true;
                        admin.save();
                    }
                }
            })
        })
        .catch(next);
        res.status(200).json({succes:true, data: resp, message: "Account confirmed"});
    }
};
