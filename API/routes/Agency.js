const express = require('express');

const aController = require('../controllers/Agency');

const agencyRouter = express.Router();

agencyRouter.route('/')
.get(aController.getAgency);

agencyRouter.route('/:agencyId')
.get(aController.getAgency);

module.exports = agencyRouter;
