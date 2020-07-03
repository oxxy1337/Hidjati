const express = require('express');

const init = require('../middlewares/initUpdate');

const initRouter = express.Router();

initRouter.post('/', init.initType);
initRouter.post('/update', init.updateStep);
initRouter.post('/Air', init.initAiro);

module.exports = initRouter;