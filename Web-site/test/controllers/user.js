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
            }
        })
        .then((resp)=>{
            req.login(resp.data, (err)=>{
                if(!err) res.status(200).render('/profile', {data: resp.data});
                else console.log(err); 
            });
        })
        .catch(next);
    },
    redirectIfLoggedIn: (req, res, next)=>{
        if(req.user) return res.render('/profile', {data: req.user});
        next();
    },
    redirectIfNotLoggedIn: (req, res, next)=>{
        if(!req.user) return res.redirect('/login');
        next();
    }, 
    logout: (req, res, next)=>{
        req.logOut();
        res.status(200).json({succes: true, data:{}, message: 'logged out!'});
    }
}