const express = require('express');
const router = express.Router();

const productController = require('../controllers/productController');

router.get('/detail/:id', productController.detail);
router.get('/product-add', productController.productAdd);
router.post('/store', productController.store);
router.post('/comentar', productController.comentar);

module.exports = router;