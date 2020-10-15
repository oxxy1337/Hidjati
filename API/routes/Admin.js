const express = require('express');

const aController = require('../controllers/Admin');
const uController = require('../controllers/User');
const pController = require('../controllers/Place');
const agController = require('../controllers/Agency');
const fbController = require('../controllers/Feedback');

const validator = require('../middlewares/validation');

const adminRouter = express.Router();

adminRouter.route('/login')
.post(/* uController.redirectIfLoggedIn , validator.loginValidation ,*/aController.connectAdmin);

//adminRouter.use(aController.isAdmin);

adminRouter.route('/operations')
.get(aController.getAdmin)
.post(aController.createAdmin)
.delete(aController.deleteAdmin);

adminRouter.route('/operations/:adminId')
.patch(aController.updateAdmin)
.get(aController.getAdmin)
.delete(aController.deleteAdmin);

adminRouter.route('/users')
.get(uController.getUser)
.post(uController.createUser)
.delete(uController.deleteUser);


adminRouter.route('/users/:userId')
.get(uController.getUser)
.patch(uController.updateUser)
.delete(uController.deleteUser);

adminRouter.route('/places')
.get(pController.getPlace)
.post(pController.createPlace)
.delete(pController.deletePlace)

adminRouter.route('/places/:placeId')
.get(pController.getPlace)
.patch(pController.updatePlace)
.delete(pController.deletePlace);

adminRouter.route('/agency')
.get(agController.getAgency)
.post(agController.createAgency)
.delete(agController.deleteAgency);

adminRouter.route('/agency/:agencyId')
.get(agController.getAgency)
.patch(agController.updateAgency)
.delete(agController.deleteAgency);

adminRouter.route('/feedbacks')
.get(fbController.getFeedback)
.post(fbController.createFeedback)
.delete(fbController.deleteFeedback);

adminRouter.route('/feedbacks/:feedbackId')
.get(fbController.getFeedback)
.delete(fbController.deleteFeedback);

adminRouter.route('/logout')
.get(aController.logout);

module.exports = adminRouter;