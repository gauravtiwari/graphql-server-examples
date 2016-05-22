import PostType from './postType';
import CommentType from './commentType';

import {
  GraphQLBoolean,
  GraphQLID,
  GraphQLInt,
  GraphQLList,
  GraphQLNonNull,
  GraphQLObjectType,
  GraphQLSchema,
  GraphQLString,
} from 'graphql';

const UserType = new GraphQLObjectType({
  name: 'UserType',
  fields: () => ({
    id: { type: new GraphQLNonNull(GraphQLID) },
    first_name: {
      type: GraphQLString,
      resolve: (obj) => obj.first_name,
    },
    last_name: {
      type: GraphQLString,
      resolve: (obj) => obj.last_name,
    },
    username: {
      type: GraphQLString,
      resolve: (obj) => obj.username,
    },
    email: {
      type: GraphQLString,
      resolve: (obj) => obj.email,
    },
    posts: {
      type: new GraphQLList(PostType),
      resolve: (obj) => obj.posts
    },
    comments: {
      type: new GraphQLList(CommentType),
      resolve: (obj) => obj.comments
    },
  }),
});

export default UserType;
