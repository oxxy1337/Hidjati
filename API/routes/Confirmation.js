const express = require('express');
const bodyParser = require('body-parser');

const confirmation = require('../middlewares/Confirmation');
const uController = require('../controllers/User');

const confirmationRouter = express.Router();

//confirmationRouter.use(uController.redirectIfLoggedIn);

confirmationRouter.use(bodyParser.json());

confirmationRouter.route('/:token')
.get(confirmation.confirmAccount);

module.exports = confirmationRouter;
