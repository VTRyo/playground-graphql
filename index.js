const { ApolloServer, gql } = require('apollo-server');

// String! means that the field is non-nullable
const typeDefs = gql`
  type User {
    id: ID!
    name: String!
    email: String!
  }

  type Query{
    hello(name: String!): String
    users: [User]
    user(id: ID!): User
  }
`;

const users = [
  { id: '1', name: 'VTRyo', email: 'VTRyo@example.com'},
  { id: '2', name: 'Kushima', email: 'Kushima@example.com'},
];

const resolvers = {
  Query: {
    hello: (parent, args) => `Hello ${args.name}`,
    users: ()  => users,
    user: (parent, args) => {
      const user = users.find((user) => user.id === args.id);
      return user;
    },
  },
};

const server = new ApolloServer({ typeDefs, resolvers});

server.listen().then(({ url }) => {
  console.log(`🐹 Sever ready at ${url}`);
});
