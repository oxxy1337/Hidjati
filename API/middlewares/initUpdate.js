const User = require('../models/pelerin');

module.exports = {
    initType: (req, res, next)=>{
        User.findById(req.body.id)
        .then((user)=>{
            user.type= req.body.type;
            user.save();
            return res.json({user: user});
        });
    },
    initAiro: (req, res, next)=>{
        User.findById(req.body.id)
        .then((user)=>{
            user.flight.departureAirport = req.body.air1;
            user.flight.arrivalAirport = req.body.air2;
            user.save();
            return res.json({user: user});
        })
    },
    updateStep: (req, res ,next)=>{
        User.findById(req.body.id)
        .then((user)=>{
            user.step++;
            user.save();
            return res.json({user: user});
        })
    }
}