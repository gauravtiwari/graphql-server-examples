# Rails Graphql Server

### Setup and Running locally

```bash
git clone repo
cd to folder
bundle install
# make sure postgres is installed
bundle exec rake db:create db:migrate
bundle exec rake db:seed
# run the server
bundle exec rails s
# Visit http://localhost:3000/
```

[Visit browser](http://localhost:3000)

### Available Queries
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
