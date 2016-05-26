# Koa GraphQL Server

## Getting started locally

```bash
git clone repo
cd express_graphql
npm install

# ORM for database interaction
npm install bookshelf -g -s
# Query building and schema/migration/seed generation
npm install knex -g -s 
# Setup database
createdb express_graphql_development
# make sure knex installed globally or refer local installation
knex migrate:latest
knex seed:run
# Run server
DEBUG=koa_graphql:* npm start
```

[Visit browser](http://localhost:3000/)

### Queries

```
{
  allPosts {
    id,
    title
    body
    user {
      id
      first_name
    }
    comments{
      id
      body
    }

  }
}
```

```
{
  post(id: 1) {
    id,
    title
    body
    user {
      id
      first_name
    }
    comments{
      id
      body
    }

  }
}
```
