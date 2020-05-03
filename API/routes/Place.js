const express = require('express');
const bodyParser = require('body-parser');

const pController = require('../controllers/Place');

const placeRouter = express.Router();

placeRouter.use(bodyParser.json());

placeRouter.route('/')
.get(pController.getPlace);
/* 
placeRouter.route('/:placeName')
.get(pController.getPlace);
 */
module.exports = placeRouter;