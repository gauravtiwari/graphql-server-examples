import postType from './types/postType';
var models  = require('../models');
import { resolver } from 'graphql-sequelize';
import { GraphQLObjectType, GraphQLNonNull, GraphQLList, GraphQLSchema, GraphQLInt, GraphQLString } from 'graphql';

let schema = new GraphQLSchema({
  query: new GraphQLObjectType({
    name: 'RootQueryType',
    fields: {
      post: {
        type: postType,
        // args will automatically be mapped to `where`
        args: {
          id: {
            description: 'id of the post',
            type: new GraphQLNonNull(GraphQLInt)
          }
        },
        resolve: resolver(models.Post)
      },
      allPosts: {
        // The resolver will use `findOne` or `findAll` depending on whether the field it's used in is a `GraphQLList` or not.
        type: new GraphQLList(postType),
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
        resolve: resolver(models.Post)
      }
    },
  })
});

module.exports = schema;
