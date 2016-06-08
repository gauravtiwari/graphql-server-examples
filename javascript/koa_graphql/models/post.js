import bookshelf from '../bookshelf';
import Comment from './comment';
import User from './user';

const Post = bookshelf.Model.extend({
  tableName: 'posts',
  hasTimestamps: ['created_at', 'updated_at'],
  comments: function() {
    return this.hasMany(Comment);
  },
  user: function() {
    return this.belongsTo(User);
  }
});

export default Post;
