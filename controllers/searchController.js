const productDescription = require('../product-description');

const search = {
    detail: (req,res) => {
        const productId = req.params.id;
        for (let i = 0; i < productDescription.length; i++) {
            const element = productDescription[i];
            if (productId == element.id) {
                return res.render('product', {product: element});
            }
        }
    },
};

module.exports = search;