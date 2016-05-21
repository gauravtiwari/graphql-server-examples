import postType from './postType';
import commentType from './commentType';
import models from '../../models';
import { resolver, attributeFields } from 'graphql-sequelize';
import { GraphQLObjectType, GraphQLNonNull, GraphQLList, GraphQLInt, GraphQLString} from 'graphql';
import { _ } from 'underscore';

let userType = new GraphQLObjectType({
  name: 'User',
  description: 'A user',
  fields: () => ({
    id: {
      type: new GraphQLNonNull(GraphQLInt),
      description: 'The id of the user.',
    },
    first_name: {
      type: GraphQLString,
      description: 'The first name of the user.',
    },
    last_name: {
      type: GraphQLString,
      description: 'The last name of the user.',
    },
    username: {
      type: GraphQLString,
      description: 'The username of the user.',
    },

    email: {
      type: GraphQLString,
      description: 'The email of the user.',
    },
  })
});

module.exports = userType;
