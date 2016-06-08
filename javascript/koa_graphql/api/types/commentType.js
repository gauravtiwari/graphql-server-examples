import PostType from './postType';
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

const CommentType = new GraphQLObjectType({
  name: 'CommentType',
  fields: () => ({
    id: { type: new GraphQLNonNull(GraphQLID) },
    body: {
      type: GraphQLString,
      resolve: (obj) => obj.body,
    },
    post: {
      type: PostType,
      resolve: (obj) => obj.post,
    },
    user: {
      type: UserType,
      resolve: (obj) => obj.user,
    },
  }),
});

export default CommentType;
