const { ApolloServer } = require('@apollo/server');
const { resolver } = require('./schema/resolver');

const { readFileSync } = require('fs');
const typeDefs = readFileSync(require.resolve('./schema/typedefs.graphql')).toString('utf-8');
const queries = readFileSync(require.resolve('./schema/queries.graphql')).toString('utf-8');
const mutations = readFileSync(require.resolve('./schema/mutations.graphql')).toString('utf-8');

// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer({
    typeDefs: [
      typeDefs,
      queries,
      mutations
    ],
    resolvers
  });
  
  module.exports.server = server;
  