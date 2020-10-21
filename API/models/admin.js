const mongoose = require('mongoose');

const Schema = mongoose.Schema;

adminSchema = new Schema({
    isAdmin:{
        type: Boolean,
        default: false
    },
    confirmed:{
        type: Boolean,
        default: false
    },
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
        required: true
    },
    first_name: {
        type: String,
        required: true
    },
    middle_name: {
        type: String,
        default: ''
    },
    last_name: {
        type: String,
        required: true
    },
    gender: {
        type: String,
        required: true
    },
    phone: {
        type: String,
        required: true,
        unique: true
    },
    imageUrl: {
        type: String,
    }
},{timestamps: true});

const Admin = mongoose.model('Admin', adminSchema);

module.exports = Admin;