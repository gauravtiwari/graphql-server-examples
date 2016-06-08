# Express GraphQL Server

## Getting started locally

```bash
git clone repo
cd express_graphql
npm install
# Setup database
createdb express_graphql_development
node_modules/sequelize-cli/bin/sequelize db:migrate
node_modules/sequelize-cli/bin/sequelize db:seed:all
# Run server
DEBUG=express_graphql:* npm start
```

[Visit browser](http://localhost:3000/)

### Supported API Queries

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
