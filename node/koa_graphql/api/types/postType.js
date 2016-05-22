import CommentType from './commentType';
import UserType from './userType';

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

const PostType = new GraphQLObjectType({
  name: 'PostType',
  fields: () => ({
    id: { type: new GraphQLNonNull(GraphQLID) },
    title: {
      type: GraphQLString,
      resolve: (obj) => obj.title,
    },
    body: {
      type: GraphQLString,
      resolve: (obj) => obj.body,
    },
    comments: {
      type: new GraphQLList(CommentType),
      resolve: (obj) => obj.comments,
    },
    user: {
      type: UserType,
      resolve: (obj) => obj.user,
    },
  }),
});

export default PostType;
