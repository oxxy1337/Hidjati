const assert = require('assert');

const Place = require('../models/place');

module.exports = {
    getPlace : (req, res, next)=>{
        if(req.params.placeId) Place.findById(req.params.placeId).then((place)=>{res.status(200).json({succes:true,data: place, message: "Place found"});}).catch(next)
        /* else if(req.query.type) Place.findOne({type: req.query.type}).then((place)=>{res.status(200).json({succes:true,data: place, message: "Place found"});}).catch(next)
        else if(req.query.name) Place.findOne({name: req.query.name}).then((place)=>{res.status(200).json({succes:true,data: place, message: "Place found"});}).catch(next)
         */else
        Place.find({})
        .then((places)=>{
            res.status(200).json({succes:true, data: places, message: "all places"});
        })
        .catch(next);
    },
    createPlace: (req, res, next)=>{
        Place.findOne({name: req.body.name})
        .then((place)=>{
            if(!place){
                Place.create(req.body, (err, place)=>{
                    if(err) next(err);
                    res.status(200).json({succes:true, data: place, message: "Place created"});
                });
            }else{
                res.status(400).json({succes:false, data: {}, message: "Place exist"});
            }
        })
        .catch(next);
    },
    deletePlace: (req, res, next)=>{
        if(req.params.placeId) Place.findByIdAndDelete(req.params.placeId).then((place)=>{res.status(200).json({succes:true, data: place, message: "Place deleted"})}).catch(next);
        else
        Place.deleteMany({})
        .then((info)=>{
            res.status(200).json({succes:true, data: info, message: "all Places deleted"});
        })
        .catch(next);
    },
    updatePlace: (req, res, next)=>{
        Place.findByIdAndUpdate(req.params.placeId, {$set: req.body}, {returnNewDocument: true})
        .then((place)=>{
            res.status(200).json({succes:true, data: place, message: "Place updated"});
        })
        .catch(next);
    }
};
