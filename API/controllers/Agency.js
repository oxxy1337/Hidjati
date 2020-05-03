const Agency = require('../models/agency')

module.exports = {
    getAgency : (req, res, next)=>{
        if(req.params.agencyId) Agency.findById(req.params.agencyId).then((agency)=>{res.status(200).json({succes:true,data: agency, message: "Agency found"})}).catch(next)
        else if(req.query.name) Agency.findOne({name: req.query.name}).then((agency)=>{res.status(200).json({succes:true,data: agency, message: "Agency found"});}).catch(next)
        else
        Agency.find({})
        .then((agencies)=>{
            res.status(200).json({succes:true, data: agencies, message: "All agencies"}); 
        })
        .catch(next);
    },
    createAgency: (req, res, next)=>{
        Agency.findOne({email: req.body.email})
        .then((agency)=>{
            if(!agency)
                Agency.create(req.body, (err, agency)=>{
                    if(err) return next(err);
                    res.status(200).json({message: 'agency created', data: agency, succes: true});
                })
            else res.status(200).json({succes: false, data:{}, message: 'agency exist'});
        })
        .catch(next);
    },
    deleteAgency: (req, res, next)=>{
        if(req.params.agencyId) Agency.findByIdAndDelete(req.params.agencyId).then((agency)=>{res.status(200).json({succes:true, data: agency, message: "Agency deleted"})}).catch((err)=>{next(err);})
        else
        Agency.deleteMany({})
        .then((agencies)=>{
            res.status(200).json({succes:true, data: agencies, message: "all agencies deleted"});
        })
        .catch(next);
    },
    updateAgency: (req, res, next)=>{
        Agency.findByIdAndUpdate(req.params.agencyId, {$set:req.body})
        .then((agency)=>{
            res.status(200).json({succes:true, data: agency, message: "Agency updated"});
        })
        .catch(next);
    }
};
