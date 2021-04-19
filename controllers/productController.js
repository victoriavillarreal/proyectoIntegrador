const productDescription = require('../product-description');

const product = {
    detail: (req,res) => {
        const productId = req.params.id;
        for (let i = 0; i < productDescription.length; i++) {
            const element = productDescription[i];
            if (productId == element.id) {
                return res.render('product', {product: element});
            }
        }
        
    },
    productAdd: (req,res) => {
        return res.render('product-add');
    }
};

module.exports = product;