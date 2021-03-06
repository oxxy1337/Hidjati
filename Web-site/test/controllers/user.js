const axios = require('axios');

module.exports = {
    create: (req, res, next)=>{
        axios({
            method: 'post',
            url :'http://localhost:3000/user/register',
        data: {
            username: req.body.username,
            email: req.body.email,
            gender: req.body.genderM || req.body.genderF,
            password: req.body.password,
            first_name: req.body.first_name,
            last_name: req.body.last_name ,
            //natio: req.body.natio || 'algerie' need to add natio in the model
        },
        headers: {
            'apikey':'123456789'
        }
        })
        .then((resp)=>{
            req.login(resp.data.data, (err)=>{
                res.locals.user = resp.data.data; // need to render the home page with the user object
                if(!err) return res.status(200).render('init', {user: resp.data.data});
                console.log(err); 
            });
        })
        .catch(next);
    },
    redirectIfLoggedIn: (req, res, next)=>{
        if(req.user) return res.redirect('/');
        next();
    },
    redirectIfNotLoggedIn: (req, res, next)=>{
        if(!req.user) return res.redirect('/login');
        next();
    }, 
    logout: (req, res, next)=>{
        req.logOut();
        next();
    },
    isInit: (req, res, next)=>{
        if(!req.user.type) return res.redirect('/init');
        if(req.route.path != ('/'+req.user.type)) return res.redirect('/'+req.user.type);
        next();
    }
}