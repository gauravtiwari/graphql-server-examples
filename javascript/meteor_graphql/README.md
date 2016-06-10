# Meteor GraphQL Server

## Getting started locally

```bash
git clone repo
cd express_graphql
npm install

meteor npm install
meteor
```

[Visit browser](http://localhost:3000/graphql)

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
