import postType from './postType';
import User from '../../models/user';

let userType = new GraphQLObjectType({
  name: 'User',
  description: 'A user',
  fields: {
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
    posts: {
      type: new GraphQLList(postType),
      resolve: resolver(User.Posts, {
        separate: true
      })
    }
  }
});
