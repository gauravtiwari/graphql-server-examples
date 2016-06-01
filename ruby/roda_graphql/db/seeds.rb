require './roda_graphql'

# using command composition
create_user = $container.command(:users).create
create_post = $container.command(:posts).create
create_comment = $container.command(:comments).create

command1 = create_user.with(
  first_name: 'John',
  last_name: 'Doe',
  username: 'johndoe',
  email: 'john@doe.com'
) >> create_post.with(
  title: 'First post title',
  body: 'First post body'
) >> create_comment.with(
  body: 'First post comment',
  user_id: 1
)

command2 = create_user.with(
  first_name: 'Maggie',
  last_name: 'Turner',
  username: 'maggie',
  email: 'maggie@turner.com'
) >> create_post.with(
  title: 'Second post title',
  body: 'Second post body'
) >> create_comment.with(
  body: 'Second post comment',
  user_id: 2
)

command1.call
command2.call
