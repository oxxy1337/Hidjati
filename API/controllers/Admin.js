require('dotenv').config();

const bcrypt = require('bcryptjs');
const mailer = require('../middlewares/mailer');
const jwt = require('jsonwebtoken');

const Admin = require('../models/admin');
const User = require('./User');

module.exports = {
    createAdmin: (req, res, next) =>{
        Admin.findOne({email: req.body.email})
        .then((admin)=>{
            if(!admin)
                bcrypt.genSalt(10 , (err, salt) =>{
                    bcrypt.hash(req.body.password, salt, (err, hash)=>{
                        req.body.password = hash;
                        Admin.create(req.body, (err, admin)=>{
                            if(err) return next(err);
                            mailer.sendEmailConfirmation(req, res, admin);
                        });
                    });
                });
            else res.json({succes: false, data: {}, message: 'Admin exist'});
        })
        .catch(next);
    },
    getAdmin: (req, res, next)=>{
        if(req.params.adminId) Admin.findById(req.params.adminId).then((admin)=>{let radmin = ({...admin}._doc);delete radmin.password;res.json({succes:true,data: radmin, message: "Admin found"})}).catch(next)
        else 
        Admin.find({})
        .then((admins)=>{
            admins.map((admin)=>{
                let radmin = ({...admin}._doc);
                delete radmin.password;
                return radmin;
            });
            res.status(200).json({succes:true, data: admins, message: "all Admins"});
        })
        .catch(next);
    },
    deleteAdmin: (req, res, next)=>{
        /* if(req.params.adminId) Admin.findOneAndDelete({username: req.params.adminId}).then((admin)=>{res.status(200).json({succes:true, data:admin, message: "admin deleted"})}).catch(next)
        else */
        Admin.deleteMany({})
        .then((info)=>{
            res.status(200).json({succes: true, data: info, message: "deleted all admins"});
        })
        .catch(next);
    },
    connectAdmin: (req, res, next)=>{
        Admin.findOne({email: req.body.email})
        .then((admin)=>{
        if(!admin) return res.json({succes: false, data: {},message: 'ivalid email'});

        bcrypt.compare(req.body.password, admin.password, (err, rep)=>{
            if(!rep) return res.json({succes: false, data: {},message: 'invalid password'})
    
            jwt.sign({userId: admin._id}, process.env.AUTH_SECRET, {expiresIn : '24h'}, (err, token)=>{
                let adm = ({...admin}._doc);
                delete adm.password;
                if(!err) res.status(200).json({succes: true, data: adm, tok:token, message: "logged in"});
            })
        });
        })
        .catch((err)=>done(err));
    },
    isAdmin: (req, res, next)=>{
        /* if(!req.user) return res.status(401).json({succes: false, data: {}, message: "not authenticated"})
        else if(!req.user.isAdmin) return res.status(403).json({succes: false, data: {}, message: "not authorized"});
        return next(); */
        jwt.verify(req.headers['auth'], process.env.AUTH_SECRET, (err, decoded)=>{
            if(err) return next(err);
            console.log(decoded);
            Admin.findById(decoded.userId)
            .then((admin)=>{
                if(admin) return next();
                return res.status(403).json({succes: false, data: {}, message: "not authorized"});
            })
        })
    },
    updateAdmin: (req, res, next)=>{
        Admin.findByIdAndUpdate(req.params.adminId, {$set: req.body}, {returnNewDocument: true})
        .then((admin)=>{
            let radmin = ({...admin}._doc);
            delete radmin.password;
            return res.json({succes:true, data: radmin, message: "admin updated"});
        })
        .catch(next);
    },
    logout: (req, res, next)=>{
        req.logOut();
        return res.status(200).json({succes: true, data: {}, message: "logged out"});
    }
};
