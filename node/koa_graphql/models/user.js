var bookshelf   = require('bookshelf');

var User = module.exports = bookshelf.Model.extend({
  tableName: 'users',
  hasTimestamps: ['created_at', 'updated_at'],
  comments: function() {
    return this.hasMany(Comment);
  },
  posts: function() {
    return this.hasMany(Post);
  }
});
