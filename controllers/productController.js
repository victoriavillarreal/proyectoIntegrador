const db = require('../database/models');
const op = db.Sequelize.Op;

const product = {
    products: (req,res) => {
        db.Product.findAll({
            include: ['user', 'comments']
        })
        .then(products => {
            return res.render('products', {products})
        })
    },
    detail: (req,res) => {
        const productId = req.params.id;
        db.Product.findByPk(productId, {
            include: ['user',{association: 'comments', include: {association: 'usuario'}}],
        })
        .then(product => {
            return res.render('product', {product})
        })
    },
    productAdd: (req,res) => {
        return res.render('product-add');
    },
    store: (req,res) => {
        let errores = [];
        if(req.body.nombre === ''){
            errores.push('El campo nombre no puede estar vacío');
        }
        if(req.body.imagen === ''){
            errores.push('El campo imagen no puede estar vacío');
        }
        if(req.body.descripcion === ''){
            errores.push('El campo descripción no puede estar vacío');
        }
        if(req.body.precio === ''){
            errores.push('El campo precio no puede estar vacío');
        }
        if(req.body.fechaCreacion === ''){
            errores.push('El campo fecha de creación no puede estar vacío');
        }
        if(errores.length === 0){
            db.Product.create({
                user_id: res.locals.user.id,
                imagen: req.file ? req.file.filename : 'default-image.png',
                nombre: req.body.nombre,
                fecha_de_creacion: req.body.fechaCreacion,
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
        productoId = req.body.producto_id;
        let errores = [];
        if(req.body.comentario === ''){
            errores.push('El campo comentario no puede estar vacío');
        }
        if(errores.length === 0){
            db.Comment.create({
                producto_id: req.body.producto_id,
                usuario_id: req.body.usuario_id,
                comentario: req.body.comentario,
                fecha_de_creacion: req.body.fechaDeCreacion
            })
            .then(() => {
                return res.redirect('/products/detail/' + productoId);
            })
            .catch(error => console.log(error));
        } else {
            return res.render('errorComentario', {errores});
        }
    },
    destroy: (req,res) => {
        db.Product.destroy({
            where: {
                id: req.body.producto_id
            }
        })
        .then(() => {
            return res.redirect('/products');
        })
    },
    update: (req,res) => {
        return res.render('productUpdate')
    },
    updateStore: (req,res) => {
        let errores = [];
        if(req.body.nombre === ''){
            errores.push('El campo nombre no puede estar vacío');
        }
        if(req.body.imagen === ''){
            errores.push('El campo imagen no puede estar vacío');
        }
        if(req.body.descripcion === ''){
            errores.push('El campo descripción no puede estar vacío');
        }
        if(req.body.precio === ''){
            errores.push('El campo precio no puede estar vacío');
        }
        if(req.body.fechaCreacion === ''){
            errores.push('El campo fecha de creación no puede estar vacío');
        }
        if(errores.length === 0){
            db.Product.findOne({
                where: [{ nombre: req.body.nombre }]
            })
            .then(product => {
                db.Product.update({
                user_id: res.locals.user.id,
                imagen: req.file ? req.file.filename : 'default-image.png',
                nombre: req.body.nombre,
                fecha_de_creacion: req.body.fechaCreacion,
                precio: req.body.precio,
                descripcion: req.body.descripcion
                },
                {
                    where: {
                        id: product.id
                    }
                })
            })
            .catch(error => console.log(error));
            
        }
    },
    buscar: (req,res) => {
        let resultado = req.query.buscar;
        db.Product.findAll({
            include: ['user', 'comments'],
            where: {
                [op.or]: [
                { nombre: { [op.like]: '%' + resultado + '%' } },
                { descripcion: { [op.like]: '%' + resultado + '%'} }
                ]
            }
        })
        .then(productosResultado => {
            if(productosResultado.length === 0){
                return res.render('productNotFound');
            } else {
                return res.render('productsSearch', {productosResultado});
            }
        })
        .catch(error => console.log(error)) 
    }
};

module.exports = product;