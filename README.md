# WIP: Various GraphQL Server API Examples

This repo is work in progress and contains various examples of GraphQL server in popular web frameworks and languages. It implements standard blog application with three models or database tables - `Users, Posts, and Comments`, the blog application serves a nice example with model relationships and eager loading of data.

If you would like to add one of your own, just open a PR.

For setting up and running these examples locally, please refer to documentation in that folder. For ex: [README.md](https://github.com/gauravtiwari/graphql-server-examples/blob/master/elixir/phoenix_graphql/README.md)

## Example implementations

Please refer to individual example folders in order to setup and run it locally. All supported GraphQL queries are listed in relevant Readme's.

### Node (without token auth)
* Express
* Koa
* Meteor

### Elixir (with token auth)
* Phoenix

### PHP (with token auth)
* Laravel
* ... More coming

### Scala (WIP)
* Play

### Python (without token auth)
* Django
* Flask
* ... More coming

### Ruby (with token auth)
* Sinatra
* Rails
* Cuba
* Roda

### TODO
* TOKEN auth
* Make API consistent in all implementations (kinda of there)
* CSRF protection for required frameworks
