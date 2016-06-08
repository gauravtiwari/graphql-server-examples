import bookshelf from '../bookshelf';
import Post from './post';
import User from './user';

const Comment = bookshelf.Model.extend({
  tableName: 'comments',
  hasTimestamps: ['created_at', 'updated_at'],
  post: function() {
    return this.belongsTo(Post);
  },
  user: function() {
    return this.belongsTo(User);
  }
});

export default Comment;
