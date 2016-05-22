import bookshelf from '../bookshelf';
import Comment from './comment';
import Post from './post';

const User = bookshelf.Model.extend({
  tableName: 'users',
  hasTimestamps: ['created_at', 'updated_at'],
  comments: function() {
    return this.hasMany(Comment);
  },
  posts: function() {
    return this.hasMany(Post);
  }
});

export default User;
