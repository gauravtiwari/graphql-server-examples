# Sinatra Graphql Server

### Setup and Running locally

```bash
git clone repo
cd to folder
bundle install
# make sure postgres is installed
createdb sinatra_graphql_development
bundle exec rake db:migrate
bundle exec rake db:seed
# run the server
bundle exec rackup -p 3000
# Visit http://localhost:3000
```

[Visit browser](http://localhost:3000)

### Supported API Queries
```
{
  all_posts {
    id,
    title,
    body,
    user {
      id,
      first_name
    }
    comments {
      id,
      body
      user {
        id,
        first_name
      }
    }

  }
 }
```

```
{
  post(id: 2) {
    id,
    title,
    body,
    user {
      id,
      first_name
    }
    comments {
      id,
      body
      user {
        id,
        first_name
      }
    }

  }
 }
 ```
