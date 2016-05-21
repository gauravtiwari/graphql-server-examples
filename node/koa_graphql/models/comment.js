var bookshelf   = require('bookshelf');

var Comment = module.exports = bookshelf.Model.extend({
  tableName: 'comments',
  hasTimestamps: ['created_at', 'updated_at'],
  post: function() {
    return this.belongsTo(Post);
  },
  user: function() {
    return this.belongsTo(User);
  }
});
