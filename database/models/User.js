module.exports = (sequelize, dataTypes) => {
    let alias = 'User';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nombre_y_apellido: {
            type: dataTypes.STRING
        },
        fecha_de_nacimiento: {
            type: dataTypes.DATE
        },
        usuario: {
            type: dataTypes.STRING
        },
        email: {
            type: dataTypes.STRING
        },
        contrasenia: {
            type: dataTypes.STRING
        },
        perfil: {
            type: dataTypes.INTEGER
        }
    }
    let config = {
        tableName: 'usuarios',
        timestamps: false,
        underscored: true
    }
    const User = sequelize.define(alias, cols, config);
    User.associate = function(models){
        User.hasMany(models.Product, {
            as : 'products',
            foreignKey : 'user_id'
        }),
        User.hasMany(models.Comment, {
            as : 'comments',
            foreignKey : 'usuario_id'
        })
    }
    return User;
}