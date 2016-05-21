import commentType from './commentType';
import userType from './userType';
import models from '../../models';
import { resolver } from 'graphql-sequelize';
import { GraphQLObjectType, GraphQLNonNull, GraphQLList, GraphQLInt, GraphQLString} from 'graphql';

let postType = new GraphQLObjectType({
  name: 'Post',
  description: 'A post',
  fields: {
    id: {
      type: new GraphQLNonNull(GraphQLInt),
      description: 'The id of the post.',
    },
    title: {
      type: GraphQLString,
      description: 'The title of the post'
    },
    body: {
      type: GraphQLString,
      description: 'The body of the post'
    },
    user: {
      type: userType,
      description: 'The user of the post',
      resolve: resolver(models.Post.User)
    },
    comments: {
      type: new GraphQLList(commentType),
      resolve: resolver(models.Post.Comments)
    }
  }
});

module.exports = postType;
