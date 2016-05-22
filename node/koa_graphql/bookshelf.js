// Update with your config settings.

var knex = require('knex')({
    client: 'postgres',
    connection: {
      host     : '127.0.0.1',
      user     : 'gaurav',
      database : 'koa_graphql_development'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  }
);

var bookshelf = module.exports = require('bookshelf')(knex);
