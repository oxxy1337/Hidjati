const Feedback = require('../models/feedback');

module.exports = {
    createFeedback: (req, res, next)=>{
        Feedback.create(req.body)
        .then((feedback)=>{
            res.status(200).json({succes: true, data: feedback, message: 'feedback created'});
        })
        .catch(next);
    },
    getFeedback: (req, res, next)=>{
        if(req.params.feedbackId) Feedback.findById(req.params.feedbackId).then((feedback)=>{return res.status(200).json({succes: true, data: feedback, message: 'feedback found'})}).catch(next)
        else if(req.query.authorId) Feedback.findOne({author_id: req.query.authorId}).then((feedback)=>{return res.status(200).json({succes: true, data: feedback, message: 'feedback found'})}).catch(next);
        else Feedback.find({})
        .then((feedbacks)=>{
            res.status(200).json({succes: true, data: feedbacks, messgae: 'All feedbacks'});
        })
        .catch(next);
    },
    deleteFeedback: (req, res, next)=>{
        if(req.params.feedbackId) Feedback.findByIdAndDelete(req.params.feedbackId).then((feedback)=>{return res.status(200).json({succes: true, data: feedback, message: 'feedback deleted'})}).catch(next)
        else if(req.query.authorId) Feedback.deleteMany({author_id: req.query.authorId}).then((info)=>{return res.status(200).json({succes: true, data: info, message: 'feedbacks deleted'})}).catch(next)
        else Feedback.deleteMany({})
        .then((info)=>{
            res.status(200).json({succes: true, data: info, message: 'feedbacks deleted'});
        })
        .catch(next);
    }
};
