const express = require('express');

const pController = require('../controllers/Place');

const placeRouter = express.Router();

placeRouter.route('/')
.get(pController.getPlace);
/* 
placeRouter.route('/:placeName')
.get(pController.getPlace);
 */
module.exports = placeRouter;