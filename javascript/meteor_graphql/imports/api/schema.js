import { Random } from 'meteor/random';
import { Posts } from '../collections/posts';
import { Comments } from '../collections/comments';
import { Users } from '../collections/users';

export const schema = [`
type User {
  _id: String
  first_name: String
  last_name: String
  username: String
  email: String
}

type Post {
  _id: String
  body: String
  title: String
  user: User
  comments: [Comment]
}

type Comment {
  _id: String
  body: String
  post: Post
  user: User
}

type Query {
  post(id: String!): Post
  allPosts: [Post]
}

schema {
  query: Query
}
`];

export const resolvers = {
  Query: {
    post(root, args, context) {
      return Posts.findOne(args.id);
    },

    allPosts(root, args, context) {
      return Posts.find().fetch();
    },
  },

  Post: {
    comments(post) {
      return Comments.find({ post: post._id }).fetch();
    },

    user(post) {
      return Users.findOne({ _id: post.user });
    },
  },

  Comment: {
    user(comment) {
      return Users.findOne({ _id: comment.user });
    },

    post(comment) {
      return Posts.findOne({ _id: comment.post });
    },
  },
}
