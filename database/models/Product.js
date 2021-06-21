module.exports = (sequelize, dataTypes) => {
    let alias = 'Product';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        user_id: {
            type: dataTypes.INTEGER
        },
        imagen: {
            type: dataTypes.STRING
        },
        nombre: {
            type: dataTypes.STRING
        },
        fecha_de_creacion: {
            type: dataTypes.DATE
        },
        precio: {
            type: dataTypes.INTEGER
        },
        // comentario_id: {
        //     type: dataTypes.INTEGER
        // },
        descripcion: {
            type: dataTypes.STRING
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
            foreignKey : 'user_id'
        }),
        Product.hasMany(models.Comment, {
            as : 'comments',
            foreignKey : 'producto_id'
        })
    }
    return Product;
}
