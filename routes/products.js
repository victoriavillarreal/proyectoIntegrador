const express = require('express');
const router = express.Router();

const productController = require('../controllers/productController');

router.use('/', productController.product);
router.use('/product-add', productController.productAdd);

module.exports = router;