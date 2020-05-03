require('dotenv').config();

const jwt = require('jsonwebtoken');

const User = require('../models/pelerin');

module.exports = {
    findUser: (req, res, next)=>{
        if(req.params.trackToken)
        jwt.verify(req.params.trackToken, process.env.TRACK_SECRET, (err, decoded)=>{
            if(err) return next(err);
            User.findById(decoded.userId)
            .then((user)=>{
                const info = {username: user.username, email: user.email, phone: user.phone, first_name: user.first_name, middle_name: user.middle_name, lastname: user.last_name, icon : user.iconUrl, imgs: user.picturesUrls};
                res.status(200).json({succes: true, data:info, message: 'user found'});
            })
            .catch(next);
        });
    }
};