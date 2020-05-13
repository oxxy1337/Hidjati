const express = require('express');

const fbController = require('../controllers/Feedback');
const uController = require('../controllers/User');

const feedbackRouter = express.Router();

//resetpassRouter.use(uController.redirectIfNotLoggedIn);

feedbackRouter.route('/')
.post(fbController.createFeedback);

module.exports = feedbackRouter;