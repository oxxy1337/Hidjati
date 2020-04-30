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
                        Admin.create(req.body)
                        .then((admin) =>{
                            mailer.sendEmailConfirmation(req, res, admin);
                        });
                    });
                });
            else res.json({message: 'userexist'});
        })
        .catch((err)=>next(err));
    },
    getAdmin: (req, res, next)=>{
        if(req.params.adminUsername) Admin.findOne({username: req.params.adminUsername}).then((admin)=>{res.json(admin)}).catch((err)=>next(err))
        else
        Admin.find({})
        .then((admins)=>{
            res.json(admins);
        });
    },
    deleteAdmin: (req, res, next)=>{
        if(req.params.adminId) Admin.findOneAndDelete({username: req.params.adminId}).then((admin)=>{res.json(admin)}).catch((err)=>next(err))
        else
        Admin.deleteMany({})
        .then((admins)=>{
            res.json(admins);
        });
    },
    connectAdmin: (req, res, next)=>{
        Admin.findOne({email: req.body.email})
        .then((admin)=>{
        if(!admin) return res.json({message: 'ivalid email'});

        bcrypt.compare(req.body.password, admin.password, (err, rep)=>{
            if(!rep) return res.json({message: 'invalid password'})
            req.login(admin, (err)=>{
                if(!err) res.redirect('/');
            });
        });
        })
        .catch((err)=>done(err));
    },
    isAdmin: (req, res, next)=>{
        if(!req.user) return res.redirect('/')
        else if(!req.user.isAdmin) return res.redirect('/notauth')
        return next();
    },
    logout: (req, res, next)=>{
        req.logOut();
        return res.status(200).json({message: 'logged out!'});
    }
}

