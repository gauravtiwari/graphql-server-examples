import Post from '../models/post';

import PostType from './types/postType';


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

let Schema = new GraphQLSchema({
  query: new GraphQLObjectType({
    name: 'RootQueryType',
    fields: () => ({
      post: {
        type: PostType,
        args: {
          id: {
            description: 'id of the post',
            type: new GraphQLNonNull(GraphQLInt)
          }
        },
        resolve: (obj, { id, ...args }) => Post.forge({ id: id }).fetch({withRelated: ['comments', 'user', 'comments.user'], debug: true}).then((post) => post.toJSON())
      },
      allPosts: {
        type: new GraphQLList(PostType),
        args: {
          limit: {
            type: GraphQLInt
          },
          order: {
            type: GraphQLString
          }
        },
        resolve: (obj, { id, ...args }) => Post.forge().fetchAll({withRelated: ['comments', 'user', 'comments.user'], debug: true}).then((posts) => posts.toJSON())
      }
    }),
  })
});


module.exports = Schema;
