const express = require('express');
const router = express.Router();

const userController = require('../controllers/userController');

router.get('/register', userController.register);
router.get('/login', userController.login);
router.get('/profile', userController.profile);
router.get('/profile-edit', userController.profileEdit);
router.post('/store', userController.store);
router.post('/ingresar', userController.ingresar);
router.get('/logout', userController.logout);
router.post('/profile-update', userController.profileUpdate);

module.exports = router;
