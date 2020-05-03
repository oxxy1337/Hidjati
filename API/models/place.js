const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const geoCoordinatesSchema = new Schema({
    latitude: {
        type: Number,
        required: true
    },
    longitude: {
        type: Number,
        required: true
    }
},{});

const placeSchema = new Schema({
    postalCode: {
        type: String
    },
    adresse: {
        type: String,
        required: true
    },
    coordonates: {
        type: geoCoordinatesSchema
    },
    name: {
        type: String,
        required: true,
        unique: true
    },
    type: {
        type: String,
        required: true
    },
    description: {
        type: String,
        default: 'This is a place !',
    },
    pictures: [String]
},{});

const Place = mongoose.model('PLace', placeSchema);

module.exports = Place;