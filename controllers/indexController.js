const db = require('../database/models');
const op = db.Sequelize.Op;


const index = {
    index: (req,res) => {
        db.Product.findAll({
            include: ['user','comments'],
            order: [
             ['fechaDeCreacion', 'DESC']
         ]
        })
         .then(productosNovedad => {
            return res.render('index', {productosNovedad})
         })
    },
    searchResults: (req,res) => {
        return res.render('search-results');
    },
    headerLogueado: (req,res) => {
        return res.render('headerLogueado');
    }
};

module.exports = index;