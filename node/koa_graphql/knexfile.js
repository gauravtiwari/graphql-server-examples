// Update with your config settings.

module.exports = {

  development: {
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
  },

  staging: {
    client: 'postgres',
    connection: {
      database: 'koa_graphql',
      user:     'gaurav'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  },

  production: {
    client: 'postgres',
    connection: {
      database: 'koa_graphql',
      user:     'gaurav',
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  }

};
