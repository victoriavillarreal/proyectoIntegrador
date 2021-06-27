const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');

const productController = require('../controllers/productController');

var storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, path.resolve(__dirname, '../public/images/products'))
    },
    filename: (req, file, cb) => {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
});
var upload = multer({storage});

router.get('/', productController.products);
router.get('/detail/:id', productController.detail);
router.get('/product-add', productController.productAdd);
router.post('/store', upload.single('imagen'), productController.store);
router.post('/comentar', productController.comentar);
router.post('/destroy', productController.destroy);
router.get('/update', productController.update);
router.post('/updateStore', productController.updateStore);
router.get('/buscar', productController.buscar)



module.exports = router;