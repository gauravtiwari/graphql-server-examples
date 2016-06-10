import Posts from './posts';
import Comments from './comments';
import Users from './users';

let Schema = {};

Schema.User = new SimpleSchema({
  name: {
    first_name: String,
    last_name: String,
    username: String,
    email: String
  },
});

Schema.Post = new SimpleSchema({
  title: {
    type: String,
    max: 140
  },
  body: {
    type: String,
    max: 2000
  },
  user: {
    type: Schema.User,
  },
});

Schema.Comment = new SimpleSchema({
  body: {
    type: String,
    max: 2000
  },
  user: {
    type: Schema.User,
  },
  post: {
    type: Schema.Post,
  },
});

Users.attachSchema(Schema.User);
Posts.attachSchema(Schema.Post);
Comments.attachSchema(Schema.Comment);
