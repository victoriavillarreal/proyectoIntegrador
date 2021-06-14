module.exports = (sequelize, dataTypes) => {
    let alias = 'Comment';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        producto_id: {
            type: dataTypes.INTEGER
        },
        usuario_id: {
            type: dataTypes.INTEGER
        },
        comentario: {
            type: dataTypes.STRING
        },
        fecha_de_creacion: {
            type: dataTypes.DATE
        }
    }
    let config = {
        tableName: 'comentarios',
        timestamps: false,
        underscored: true
    }
    const Comment = sequelize.define(alias, cols, config);
    Comment.associate = function(models){
        Comment.belongsTo(models.User, {
            as : 'usuario',
            foreignKey : 'usuario_id'
        }),
        Comment.belongsTo(models.Product, {
            as : 'product',
            foreignKey : 'producto_id'
        })
    }

    return Comment;
}