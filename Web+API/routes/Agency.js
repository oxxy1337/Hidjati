const express = require('express');
const bodyParser = require('body-parser');

const aController = require('../controllers/Agency');

const agencyRouter = express.Router();

agencyRouter.use(bodyParser.json());

agencyRouter.route('/')
.get(aController.getAgency);

agencyRouter.route('/:agencyName')
.get(aController.getAgency);

module.exports = agencyRouter;