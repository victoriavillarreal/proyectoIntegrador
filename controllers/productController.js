const productDescription = require('../product-description');

const product = {
    product: (req,res) => {
        return res.render('product', {productDescription});
    },
    productAdd: (req,res) => {
        return res.render('product-add');
    }
};

module.exports = product;