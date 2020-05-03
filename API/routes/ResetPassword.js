const express = require('express');

const resetPassword = require('../middlewares/ResetPassword');

const uController = require('../controllers/User');

const resetpassRouter = express.Router();

//resetpassRouter.use(uController.redirectIfLoggedIn);

resetpassRouter.route('/')
.get((req, res, next)=>{
    res.json({message: 'reset pass here'});
})
.post(resetPassword.resetPassEmail);

resetpassRouter.route('/:passToken')
.get((req, res, next)=>{
    res.json({message: 'this is the page'});
})
.post(resetPassword.resetPass);

module.exports = resetpassRouter;