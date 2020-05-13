const bcrypt = require('bcryptjs');
const mailer = require('../middlewares/mailer');

const Admin = require('../models/admin');

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
        if(req.params.adminUsername) Admin.findOne({username: req.params.adminUsername}).then((admin)=>{res.json({succes:true,data: admin, message: "Admin found"})}).catch(next)
        else
        Admin.find({})
        .then((admins)=>{
            res.status(200).json({succes:true, data: admins, message: "all Admins"});
        })
        .catch(next);
    },
    deleteAdmin: (req, res, next)=>{
        if(req.params.adminId) Admin.findOneAndDelete({username: req.params.adminId}).then((admin)=>{res.status(200).json({succes:true, data:admin, message: "admin deleted"})}).catch(next)
        else
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
            if(!rep) return res.json({message: 'invalid password'})
            req.login(admin, (err)=>{
                if(!err) res.status(200).json({succes: true, data: {}, message: "logged in"});
            });
        });
        })
        .catch((err)=>done(err));
    },
    isAdmin: (req, res, next)=>{
        if(!req.user) return res.status(401).json({succes: false, data: {}, message: "not authenticated"})
        else if(!req.user.isAdmin) return res.status(403).json({succes: false, data: {}, message: "not authorized"});
        return next();
    },
    logout: (req, res, next)=>{
        req.logOut();
        return res.status(200).json({succes: true, data: {}, message: "logged out"});
    }
};
