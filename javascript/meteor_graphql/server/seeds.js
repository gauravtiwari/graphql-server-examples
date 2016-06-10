import { Posts } from '../imports/collections/posts';
import { Comments } from '../imports/collections/comments';
import { Users } from '../imports/collections/users';

import UsersSeed from './fixtures/users';

Meteor.methods({
  'Database.seed': function() {
    _.forEach(UsersSeed, function(user) {
      let userObj = Users.insert(user, function(error, result) {
        console.log('Users added', result);
      });

      let postObject = Posts.insert({
        title: 'this is post title',
        body: 'this is post body',
        user: userObj,
      }, function(error, result) {
        const Comment = {
          post: postObject,
          user: userObj,
          body: 'this is a comment for this post',
        };
        Comments.insert(Comment, function(error, result) {
          console.log('Comment added for', postObject);
        });
      });
    });
  }
});
