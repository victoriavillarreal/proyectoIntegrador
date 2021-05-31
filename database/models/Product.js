module.exports = (sequelize, dataTypes) => {
    let alias = 'Product';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        usuario_id: {
            type: dataTypes.INTEGER
        },
        imagen: {
            type: dataTypes.VARCHAR
        },
        nombre: {
            type: dataTypes.VARCHAR
        },
        fechaDeCreación: {
            type: dataTypes.DATE
        },
        precio: {
            type: dataTypes.INTEGER
        }
    }
    let config = {
        tableName: 'productos',
        timestamps: false,
        underscored: true
    }
    const Product = sequelize.define(alias, cols, config);
    Product.associate = function(models){
        Product.belongsTo(models.User, {
            as : 'user',
            foreignKey : 'usuario_id'
        })
    }
    return Product;
}