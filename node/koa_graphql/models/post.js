var bookshelf   = require('bookshelf');

var Post = module.exports = bookshelf.Model.extend({
  tableName: 'posts',
  hasTimestamps: ['created_at', 'updated_at'],
  comments: function() {
    return this.hasMany(Comment);
  }
});
