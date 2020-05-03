const express = require('express');

const aController = require('../controllers/Admin');
const uController = require('../controllers/User');
const pController = require('../controllers/Place');
const agController = require('../controllers/Agency');

const validator = require('../middlewares/validation');

const adminRouter = express.Router();

adminRouter.route('/login')

/* .get((req, res, next)=>{
    if(req.user) return res.status(200).json({succes: true, data: {}, message: 'already logged in'})
    res.status(200).json({sucess: true, data: {}, message: 'logged in'});
})
 */

.post(/* uController.redirectIfLoggedIn , */validator.loginValidation ,aController.connectAdmin);

//adminRouter.use(aController.isAdmin);

adminRouter.route('/operations')
.get(aController.getAdmin)
.post(aController.createAdmin)
.delete(aController.deleteAdmin);

adminRouter.route('/operations/:adminId')
.get(aController.getAdmin)
.delete(aController.deleteAdmin);

adminRouter.route('/users')
.get(uController.getUser)
.post(uController.createUser)
.delete(uController.deleteUser);

adminRouter.route('/users/userId')
.get(uController.getUser)
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

adminRouter.route('/logout')
.get(aController.logout);

module.exports = adminRouter;