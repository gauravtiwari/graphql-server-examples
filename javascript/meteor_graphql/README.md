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
    _id,
    title
    body
    user {
      _id
      first_name
    }
    comments{
      _id
      body
    }

  }
}
```

```
{
  post(id: "qEsSyu5wHec6e67AW") {
    _id,
    title
    body
    user {
      _id
      first_name
    }
    comments{
      _id
      body
    }

  }
}
```
