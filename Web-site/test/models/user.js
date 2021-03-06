const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const flightSchema = new Schema({
    departureAirport: {
        type: String,
        required: false
    },
    d_departureTime: {
        type: Date,
        required: true
    },
    d_arrivalTime: {
        type: Date,
        required: true
    },
    arrivalAirport: {
        type: String,
        required: true
    },
    a_departureTime: {
        type: Date,
        required: true
    },
    a_arrivalTime: {
        type: Date,
        required: true
    }
},{_id: false});

const pelerinSchema = new Schema({
    username: {
        type: String,
        required: true,
        unique: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        minlength:8,
        required: true
    },
    first_name: {
        type: String,
      //  required: true
    },
    middle_name: {
        type: String,
        default: ''
    },
    last_name: {
        type: String,
        //required: true
    },
    gender: {
        type: String,
        required: true
    },
    age: {
        type: Number,
        max:120,
        min:10,
        //required: true
    },
    phone: {
        type: String,
        //required: true,
        unique: true,
        sparse: true
    },
    confirmed: {
        type: Boolean,
        default: false
    },
    type: {
        type: String
    },
    step: {
        type: Number,
        default: 1
    },
    flight: {
        type: flightSchema
    },
    iconUrl: {
        type: String,
        default: ""
    },
    picturesUrls:{
        type: [String],
        default: ""
    },
    traceToken: {
        type: String
    }
},{timestamps: true});

const Pelerin = mongoose.model('Pelerin', pelerinSchema);

module.exports = Pelerin;