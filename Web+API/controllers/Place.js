const assert = require('assert');

const Place = require('../models/place');

module.exports = {
    getPlace : (req, res, next)=>{
        if(req.params.placeId) Place.findById(req.params.placeId).then((place)=>{res.json(place);}).catch((err)=>next(err))
        else if(req.query.type) Place.findOne({type: req.query.type}).then((place)=>{res.json(place);}).catch((err)=>next(err))
        else if(req.query.name) Place.findOne({name: req.query.name}).then((place)=>{res.json(place);}).catch((err)=>next(err))
        else
        Place.find({})
        .then((places)=>{
            res.json({Places: places});
        })
        .catch((err)=> next(err));
    },
    createPlace: (req, res, next)=>{
        Place.findOne({name: req.body.name})
        .then((place)=>{
            if(!place){
                Place.create(req.body)
                .then((place)=>{
                    res.json({message: 'place created', Place: place});
                });
            }else{
                res.json({message: 'place exist'});
            }
        })
        .catch((err)=> next(err));
    },
    deletePlace: (req, res, next)=>{
        if(req.params.placeId) Place.findByIdAndDelete(req.params.placeId).then((place)=>{res.json(place)}).catch((err)=>next(err));
        else
        Place.deleteMany({})
        .then((info)=>{
            res.json(info);
        })
        .catch((err)=>next(err));
    },
    updatePlace: (req, res, next)=>{
        Place.findByIdAndUpdate(req.params.placeId, {$set: req.body}, {returnNewDocument: true})
        .then((place)=>{
            res.json(place);
        })
    }
}