const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const agencySchema = new Schema({
    name: {
        type: String,
        required: true,
        unique: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    phone: {
        type: String,
        required: true,
        unique: true
    },
    adress: {
        type: String,
        required: true,
    },
    openingHours: {
        type: String,
    },
    priceRange: {
        type: String,
    },
    discription: {
        type: String,
        required: true  
    },
    pictures: [String]
},{});

const Agency = mongoose.model('Agency', agencySchema);

module.exports = Agency;