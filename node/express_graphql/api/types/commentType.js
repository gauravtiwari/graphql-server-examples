import userType from './userType';
import models from '../../models';
import { resolver } from 'graphql-sequelize';
import { GraphQLObjectType, GraphQLNonNull, GraphQLList, GraphQLInt, GraphQLString} from 'graphql';

let commentType = new GraphQLObjectType({
  name: 'Comment',
  description: 'A comment',
  fields: {
    id: {
      type: new GraphQLNonNull(GraphQLInt),
      description: 'The id of the comment.',
    },
    body: {
      type: GraphQLString,
      description: 'The body of the comment'
    },
    user: {
      type: userType,
      description: 'The user of the comment',
      resolve: resolver(models.User)
    },
  }
});

module.exports = commentType;
