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
        // args will automatically be mapped to `where`
        args: {
          id: {
            description: 'id of the post',
            type: new GraphQLNonNull(GraphQLInt)
          }
        },
        resolve: (obj, { id, ...args }) => Post.forge({ id: id }).fetch({withRelated: ['comments', 'user', 'comments.user'], debug: true}).then((post) => post.toJSON())
      },
      allPosts: {
        // The resolver will use `findOne` or `findAll` depending on whether the field it's used in is a `GraphQLList` or not.
        type: new GraphQLList(PostType),
        args: {
          // An arg with the key limit will automatically be converted to a limit on the target
          limit: {
            type: GraphQLInt
          },
          // An arg with the key order will automatically be converted to a order on the target
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
