# Laravel Graphql Server

### Running locally

``` bash
git clone repo
cd repo
createdb laravel_graphql
php artisan migrate
php artisan db:seed
php artisan serve
```
[Visit browser](http://localhost:8000/)

# Features
* Graphql API
* CSRF and SESSION
* TOKEN AUTH

### Supported API queries

```
{
  posts {
    id,
    title,
    body,
    comments {
      id,
      body
    }
    user {
      id,
      first_name
    }
  }
}
```
```
{
  posts(id: 1) {
    id,
    title,
    body,
    comments {
      id,
      body
    }
    user {
      id,
      first_name
    }
  }
}
```

```
{
  posts(id: 1) {
    id,
    title,
    body,
    comments {
      id,
      body
      user {
        id
        first_name
      }
    }
    user {
      id,
      first_name
    }
  }
}
```
