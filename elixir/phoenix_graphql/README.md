# Phoenix Graphql Server

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Seed the database with `mix run priv/repo/seeds.exs`
  * Start Phoenix endpoint with `mix phoenix.server`

*Note: Make sure to change the db settings in dev.exs*

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Supported API Queries

```
query {
  user(id: 1) {
    id,
    firstName
    posts {
      id
      body
    }
  }
}
```

```
query {
  post(id: 1) {
    id
    title
    body
    comments {
      id
      body
    }
    user {
      id
      firstName
    }
  }
}
```

```
query {
  posts {
    id
    title
    body
    comments {
      id
      body
    }
    user {
      id
      firstName
    }
  }
}
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
