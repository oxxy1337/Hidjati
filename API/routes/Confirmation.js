const express = require('express');

const confirmation = require('../middlewares/Confirmation');
const uController = require('../controllers/User');

const confirmationRouter = express.Router();

confirmationRouter.route('/:token')
.get(confirmation.confirmAccount);

module.exports = confirmationRouter;
