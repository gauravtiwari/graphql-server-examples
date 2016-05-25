# Flask Graphql

```bash
git clone repo
cd folder
createdb flask_graphql
sudo -H pip install -r requirements.md
python manage.py db init
python manage.py db migrate
python seed.py
python app.py
```

[Visit](http://127.0.0.1:5000/)

### Queries

```
{
  allPosts {
    id,
    title,
    user {
      id
      firstName
    }
  }
}
```

```
{
  post(id: 1) {
    id,
    title,
    user {
      id
      firstName
    }
  }
}
```
