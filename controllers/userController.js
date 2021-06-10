const db = require('../database/models');
const bcrypt = require('bcryptjs');

const user = {
    register: (req,res) => {
        return res.render('register');
    },
    login: (req,res) => {
        if(req.session.user === undefined){
            return res.redirect('/users/login');
        } else {
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
                     return res.redirect('/users/profile');
                 } else {
                    return res.render('userNull');
                }
            }
            
        })
    },
    profile: (req,res) => {
        return res.render('profile');
    },
    profileEdit: (req,res) => {
        return res.render('profile-edit');
    },
    store: (req,res) => {
        let errores = [];
        if(req.body.nombre-apellido === ''){
            errores.push('El campo nombre y apellido no puede estar vacío');
        }
        if(req.body.fecha-de-nacimiento === ''){
            errores.push('El campo fecha de nacimiento no puede estar vacío');
        }
        if(req.body.usuario === ''){
            errores.push('El campo usuario no puede estar vacío');
        }
        if(req.body.contrasenia === ''){
            errores.push('El campo contraseña no puede estar vacío');
        }
        if(req.body.email === ''){
            errores.push('El campo email no puede estar vacío');
        }
        if(errores.length === 0){
            db.User.create({
                nombreYApellido: req.body.nombre-apellido,
                fechaDeNacimiento: req.body.fecha-de-nacimiento,
                usuario: req.body.usuario,
                contrasenia: bcrypt.hashSync(req.body.contrasenia, 10),
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
        req.session.destroy;
        res.cookie('userId', '', {maxAge : -1 });
        return res.redirect('/');
    }
};

module.exports = user;