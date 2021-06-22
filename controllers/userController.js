const db = require('../database/models');
const bcrypt = require('bcryptjs');

const user = {
    register: (req,res) => {
        return res.render('register');
    },
    login: (req,res) => {
        if(req.session.user === undefined){
            return res.render('login');
        }else{
            return res.redirect('/users/profile');
        }
    },
    ingresar: (req,res) => {
        db.User.findOne({
            where: [{ email: req.body.email }]
        })
        .then(usuario => {
            if (usuario == null) {
                return res.render('userNull');
            } else {
                if (bcrypt.compareSync(req.body.contrasenia, usuario.contrasenia)) {
                    req.session.user = usuario;
                    if(req.body.recordarme){
                        res.cookie('userId', usuario.id, {maxAge: 1000*60*60*24})
                    }
                    return res.redirect('/users/profileLogueado');
                } else {
                    return res.render('userNull');
                }
            }
            
        })
    },
    profile: (req,res) => {
        const userId = req.params.id;
        db.User.findByPk(userId, {
            include: ['products', 'comments']
        })
        .then(usuario => {
            return res.render('profile', {usuario});
        })
        
    },
    profileLogueado: (req,res) => {
        const userId = res.locals.user.id;
        db.User.findByPk(userId, {
            include: ['products', 'comments']
        })
        .then(usuario => {
            return res.render('profileLogueado', {usuario});
        })
    },
    profileEdit: (req,res) => {
        return res.render('profile-edit');
    },
    store: (req,res) => {
        let errores = [];
        if(req.body.nombreApellido === ''){
            errores.push('El campo nombre y apellido no puede estar vacío');
        }
        if(req.body.fechaDeNacimiento === ''){
            errores.push('El campo fecha de nacimiento no puede estar vacío');
        }
        if(req.body.usuario === ''){
            errores.push('El campo usuario no puede estar vacío');
        }
        if(req.body.contrasenia === '' || req.body.contrasenia.length < 3){
            errores.push('El campo contraseña no puede estar vacío y debe tener al menos tres caracteres');
        }
        if(req.body.email === ''){
            errores.push('El campo email no puede estar vacío');
        }
        if(errores.length === 0){
            db.User.create({
                nombre_y_apellido: req.body.nombreApellido,
                fecha_de_nacimiento: req.body.fechaDeNacimiento,
                usuario: req.body.usuario,
                contrasenia: bcrypt.hashSync(req.body.contrasenia, 10),
                email: req.body.email,
                perfil: 1
            })
            .then(() => {
                return res.redirect('/');
            })
            .catch(error => console.log(error));
        } else {
            return res.render('errorUsuario', {errores});
        }
    },
    logout: (req,res) =>{
        req.session.destroy();
        res.cookie('userId', '', {maxAge : -1 });
        return res.redirect('/');
    },
    profileUpdate: (req,res) => {
        let errores = [];
        if(req.body.nombreApellido === ''){
            errores.push('El campo nombre y apellido no puede estar vacío');
        }
        if(req.body.fechaDeNacimiento === ''){
            errores.push('El campo fecha de nacimiento no puede estar vacío');
        }
        if(req.body.usuario === ''){
            errores.push('El campo usuario no puede estar vacío');
        }
        if(req.body.contrasenia === '' || req.body.contrasenia.length < 3){
            errores.push('El campo contraseña no puede estar vacío y debe tener al menos tres caracteres');
        }
        if(req.body.email === ''){
            errores.push('El campo email no puede estar vacío');
        }
        if(errores.length === 0 && locals.user.email === req.body.email){
            db.User.update({
                nombre_y_apellido: req.body.nombreApellido,
                fecha_de_nacimiento: req.body.fechaDeNacimiento,
                usuario: req.body.usuario,
                email: req.body.email,
                contrasenia: req.body.contrasenia,
                perfil: 1
            },
            {
                where: {
                    id: res.locals.user.id
                }
            })
            .then(() => {
                return res.redirect('/users/profile');
            })
            .catch(error => console.log(error));
        } else {
            return res.render('errorUsuario', {errores});
        }
    }
};

module.exports = user;