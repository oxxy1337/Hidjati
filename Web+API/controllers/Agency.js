const Agency = require('../models/agency')

module.exports = {
    getAgency : (req, res, next)=>{
        if(req.params.agencyId) Agency.findById(req.params.agencyId).then((agency)=>{res.json(agency)}).catch(next)
        else if(req.query.name) Agency.findOne({name: req.query.name}).then((agency)=>{res.json(agency);}).catch(next)
        else
        Agency.find({})
        .then((agencies)=>{
            res.json({Agencies: agencies}); 
        })
        .catch(next);
    },
    createAgency: (req, res, next)=>{
        Agency.findOne({email: req.body.email})
        .then((agency)=>{
            if(!agency)
                Agency.create(req.body)
                .then((agency)=>{
                    res.json({message: 'agency created', Agency: agency});
                });
            else res.json({message: 'agency exist'});
        })
        .catch(next);
    },
    deleteAgency: (req, res, next)=>{
        if(req.params.agencyId) Agency.findByIdAndDelete(req.params.agencyId).then((user)=>{res.json(user)}).catch((err)=>{next(err);})
        else
        Agency.deleteMany({})
        .then((users)=>{
            res.json(users);
        })
        .catch(next);
    },
    updateAgency: (req, res, next)=>{
        Agency.findByIdAndUpdate(req.params.agencyId, {$set:req.body})
        .then((user)=>{
            res.json(user);
        })
        .catch(next);
    }
}