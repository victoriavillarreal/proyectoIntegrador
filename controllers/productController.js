const db = require('../database/models');
const op = db.Sequelize.Op;

const product = {
    detail: (req,res) => {
        const productId = req.params.id;
        db.Product.findByPk(productId, {
            include: ['user',{association: 'comments', include: {association: 'usuario'}}],
        })
        .then(product => {
            // return res.send(product);
            return res.render('product', {product})
        })
    },
    productAdd: (req,res) => {
        return res.render('product-add');
    },
    store: (req,res) => {
        let errores = [];
        if(req.body.nombre-producto === ''){
            errores.push('El campo nombre no puede estar vacío');
        }
        if(req.body.imagen-producto === ''){
            errores.push('El campo imagen no puede estar vacío');
        }
        if(req.body.usuario === ''){
            errores.push('El campo usuario no puede estar vacío');
        }
        if(req.body.fecha-creacion-producto === ''){
            errores.push('El campo fecha de creación no puede estar vacío');
        }
        if(errores.length === 0){
            db.Product.create({
                // usuario: req.body.usuario ??
                imagen: req.file ? req.file.fileName : '',
                nombre: req.body.nombre-producto,
                fecha_de_creacion: req.body.fecha-creacion-producto,
                precio: req.body.precio,
                descripcion: req.body.descripcion
            })
            .then(() => {
                return res.redirect('/products');
            })
            .catch(error => console.log(error));
        } else {
            return res.render('errorProducto', {errores});
        }
    },
    comentar: (req,res) => {
        let errores = [];
        if(req.body.comentario === ''){
            errores.push('El campo comentario no puede estar vacío');
        }
        if(errores.length === 0){
            db.Comment.create({
                producto_id: productId
            })
        }
    }
};

module.exports = product;