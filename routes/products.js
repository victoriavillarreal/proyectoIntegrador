const express = require('express');
const router = express.Router();

const productController = require('../controllers/productController');

router.get('/', productController.product);
router.get('/product-add', productController.productAdd);

module.exports = router;