const db = require('../database/models');
const op = db.Sequelize.Op;


const index = {
    index: (req,res) => {
        db.Product.findAll({
            include: ['user','comments'],
            order: [
            ['fecha_de_creacion', 'DESC']
            ],
            limit: 8
        })
        .then(productosNovedad => {
            return res.render('index', {productosNovedad})
        })
    },
};

module.exports = index;