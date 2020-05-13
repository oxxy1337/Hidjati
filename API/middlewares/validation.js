const Joi = require('@hapi/joi');

const registerValidation = (data) =>{

    const schema = Joi.object({
        username: Joi.string()
                .alphanum()
                .min(6)
                .max(24)
                .required(),
        email: Joi.string()
                .required()
                .email(),
        password: Joi.string()
                .min(8)
                .max(32)
                .required(),
        first_name: Joi.string()
                .min(6)
                .pattern(new RegExp('^[a-zA-Z]+$'))
                .max(24),
//                .required(),
        middle_name: Joi.string()
                .min(6)
                .pattern(new RegExp('^[a-zA-Z]+$'))
                .max(24),
        last_name: Joi.string()
                .min(6)
                .pattern(new RegExp('^[a-zA-Z]+$'))
                .max(24),
                //.required(),
        gender: Joi.string()
                .pattern(new RegExp('^[a-zA-Z]+$'))
                .required(),
        age: Joi.number()
                .min(10)
                .max(120),
        phone: Joi.string()
                .pattern(new RegExp('^[+]*[(][0-9]{1,4}[)][\ ]?[/0-9]{4,12}$')),
        flight: Joi.object().keys({
            departureAirport: Joi.string()
                            .required(),
            d_departureTime: Joi.date()
                            .required(),
            d_arrivalTime: Joi.date()
                            .required(),
            arrivalAirport: Joi.string()
                            .required(),
            a_departureTime: Joi.date()
                            .required(),
            a_arrivalTime: Joi.date()
                            .required()
        })
    });

    return schema.validate(data);
}

const loginValidation = (data) =>{

        const schema = Joi.object({
                email: Joi.string()
                        .email()
                        .required(),
                password: Joi.string()
                        .min(8)
                        .required()
        }).unknown();

    return schema.validate(data);
}

const createAgencyValidation = (data) =>{

        const schema = Joi.object({
                name: Joi.string()
                        .alphanum()
                        .required()
                        .min(8),
                    email: Joi.string()
                        .email()
                        .required(),
                    phone: Joi.string()
                        .pattern(new RegExp('^[+]*[(][0-9]{1,4}[)][\ ]?[/0-9]{4,12}$'))
                        .required(),
                    adress: Joi.string()
                        .alphanum()
                        .required(),
                    openingHours: Joi.string(),
                    priceRange: Joi.string(),
                    discription: Joi.string()
                        .required()
        }).unknown();

        return schema.validate(data);
}

const createPlaceVlidation = (data) =>{
        const schema = Joi.object({
                
                postalCode: Joi.number(),
                adresse: Joi.string()
                        .alphanum()
                        .required(),
                coordonates: Joi.object({
                        latitude: Joi.number()
                                .positive()
                                .required(),
                        longitude: Joi.number()
                                .positive()
                                .required()
                }),
                name: Joi.string()
                        .alphanum()
                        .min(6)
                        .max(24)
                        .required(),
                type: Joi.string()
                        .min(4)
                        .alphanum()
                        .required(),
                description: Joi.string()
                        .required()
        }).unknown();

        return schema.validate(data);
}

const updateAgencyValidation = (data) =>{

        const schema = Joi.object({
                name: Joi.string()
                        .alphanum()
                        .min(8),
                    email: Joi.string()
                        .email(),
                    phone: Joi.string()
                        .pattern(new RegExp('^[+]*[(][0-9]{1,4}[)][\ ]?[/0-9]{4,12}$')),
                    adress: Joi.string()
                        .alphanum(),
                    openingHours: Joi.string(),
                    priceRange: Joi.string(),
                    discription: Joi.string()
        }).unknown();

        return schema.validate(data);
}

const updatePlaceVlidation = (data) =>{
        const schema = Joi.object({
                
                postalCode: Joi.number(),
                adresse: Joi.string()
                        .alphanum(),
                coordonates: Joi.object({
                        latitude: Joi.number()
                                .positive(),
                        longitude: Joi.number()
                                .positive()
                }),
                name: Joi.string()
                        .alphanum()
                        .min(6)
                        .max(24),
                type: Joi.string()
                        .min(4)
                        .alphanum(),
                description: Joi.string()
        }).unknown();

        return schema.validate(data);
}

const check = (fct, req, res, next)=>{
        const {error} = fct(req.body);
        if(error) return next(error); next();}

module.exports = {
        registerValidation : (req, res, next)=>{check(registerValidation, req, res, next)},
        loginValidation : (req, res, next)=>{check(loginValidation, req, res, next)},
        createPlaceValidation : (req, res, next)=>{check(createPlaceVlidation, req, res, next)},
        createAgencyValidation : (req, res, next)=>{check(createAgencyValidation, req, res, next)},        
        updatePlaceVlidation: (req, res, next)=>{check(updatePlaceVlidation, req, res, next)},
        updateAgencyValidation: (req, res, next)=>{check(updateAgencyValidation, req, res, next)}
};