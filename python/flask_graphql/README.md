# Flask Graphql

```bash
git clone repo
cd folder
createdb flask_graphql
sudo -H pip install -r requirements.md
python manage.py db init
python manage.py db migrate
python seed.py
# Add env variables
export APP_SETTINGS=config.DevelopmentConfig
export DATABASE_URL="postgresql://localhost/flask_graphql"
python app.py
```

* Note: If you using password and username for postgres please include that in the url

[Visit browser](http://127.0.0.1:5000/)

### Supported API Queries

```
{
  allPosts {
    id,
    title
    body
    user {
      id
      firstName
    }
    comments{
      id
      body
      user{
        id
        firstName
      }
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
      firstName
    }
    comments{
      id
      body
      user{
        id
        firstName
      }
    }

  }
}
```

```
{
  user(id: 1) {
    id,
    firstName
    posts{
      id
      body
      user{
        id
        firstName
      }
    }

  }
}
```
