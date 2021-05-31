module.exports = (sequelize, dataTypes) => {
    let alias = 'User';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nombreYApellido: {
            type: dataTypes.VARCHAR
        },
        fechaDeNacimiento: {
            type: dataTypes.DATE
        },
        usuario: {
            type: dataTypes.VARCHAR
        },
        contrasenia: {
            type: dataTypes.VARCHAR
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
            foreignKey : 'usuario_id'
        })
    }
    return User;
}