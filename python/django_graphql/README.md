# Flask Graphql

```bash
git clone repo
cd folder
sudo -H pip install -r requirements.md
python ./manage.py loaddata seed
python manage.py runserver
```

[Visit browser](http://127.0.0.1:8000/)

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
