const passport = require('passport');
const bcrypt = require('bcryptjs');
const localStrategy = require('passport-local').Strategy;

const User = require('../models/user');
const Admin = require('../models/admin');


passport.use('Admin', new localStrategy({usernameField: 'email'}, (username, password, done)=>{
    Admin.findOne({email: username})
    .then((admin)=>{
        if(!admin) return done(null, false, {message: 'ivalid email'});

        bcrypt.compare(password, admin.password, (err, rep)=>{
            if(!rep) return done(null, false, {message: 'invalid password'})
            return done(null, true);
        });
    })
    .catch((err)=>done(err));
}));

passport.use('User', new localStrategy({usernameField: 'email'}, (username, password, done)=>{
    User.findOne({email: username})
    .then((user)=>{
        if(!user) return done(null, false, {message: 'ivalid email'});
        
        bcrypt.compare(password, user.password, (err, rep)=>{
            if(!rep) return done(null, false, {message: 'invalid password'});
            return done(null, user);
        });
    })
    .catch((err)=>done(err));
}));

passport.serializeUser(function(user, done) { 
    done(null, user);
  });
  
  passport.deserializeUser(function(user, done) {
    if(user!=null)
      done(null,user);
  });
  
module.exports = {
    initialize: passport.initialize(),
    session: passport.session(),
    setUser: (req, res, next)=>{
        res.locals.user = req.user;
        return next();
    },
    logInUser: passport.authenticate('User', {
        successRedirect: '/succes',
        failureRedirect: '/login'
    })
};