const UserType = new GraphQLObjectType({
  name: 'User',
  fields: {
    id: globalIdField('User'),
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
  },
});

const Root = new GraphQLObjectType({
  name: 'Root',
  fields: {
  },
});


var schema = new GraphQLSchema({
  query: Root,
});

module.exports = Schema;
