const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const feedbackSchema = new Schema({
    author_id: {
        type: mongoose.Types.ObjectId,
        required: true,
    },
    subject: {
        type: String
    },
    content: {
        type: String
    },
    note: {
        type: Number,
        required: true,
        min: 0,
        max: 5
    }
},{timestamps: true});

const Feedback = mongoose.model('Feedback', feedbackSchema);

module.exports = Feedback;