require('dotenv').config();

const jwt = require('jsonwebtoken');

const User = require('../models/pelerin');
const Admin = require('../models/admin');

module.exports = {
    confirmAccount : async (req, res, next)=>{
        var resp;
        const id = await jwt.verify(req.params.token, process.env.CONFIRMATION_SECRET).userId;
        User.findById(id)
        .then(async(user)=>{
            if(user){
                let ruser = ({...user}._doc);
                delete ruser.password;
                resp = ruser;
                if(!user.confirmed){
                    user.confirmed = true;
                    await user.save({validateBeforeSave: false });
                }
            }else
            Admin.findById(id)
            .then(async (admin)=>{
                if(admin){
                    let radmin = ({...admin}._doc);
                    delete radmin.password;
                    resp = radmin;
                    if(!admin.confirmed){
                        admin.confirmed = true;
                        await admin.save({validateBeforeSave: false });
                    }
                }
            })
        })
        .catch(next);
        res.status(200).json({succes:true, data: resp, message: "Account confirmed"});
    }
};
