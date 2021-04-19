const productDescription = require('../product-description');

const index = {
    index: (req,res) => {
        return res.render('index', {productDescription});
    },
    searchResults: (req,res) => {
        return res.render('search-results');
    },
    headerLogueado: (req,res) => {
        return res.render('headerLogueado');
    }
};

module.exports = index;