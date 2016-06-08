'use strict';
module.exports = function(sequelize, DataTypes) {
  var User = sequelize.define('User', {
    first_name: DataTypes.STRING,
    last_name: DataTypes.STRING,
    email: DataTypes.STRING,
    username: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        User.Comments = User.hasMany(models.Comment);
        User.Posts = User.hasMany(models.Post);
      }
    }
  });
  return User;
};
