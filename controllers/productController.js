const product = {
    product: (req,res) => {
        return res.render('product');
    },
    productAdd: (req,res) => {
        return res.render('product-add');
    }
};

module.exports = product;