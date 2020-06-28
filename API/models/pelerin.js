const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const flightSchema = new Schema({
    departureAirport: {
        type: String,
    },
    d_departureTime: {
        type: Date,
    },
    d_arrivalTime: {
        type: Date,
    },
    arrivalAirport: {
        type: String,
    },
    a_departureTime: {
        type: Date,
    },
    a_arrivalTime: {
        type: Date,
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
        type: flightSchema,
        default:{}
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