from models import db
from models import Post
from models import Comment
from models import User

db.create_all()

john = User(first_name='John', last_name='Doe', email="john@doe.com", username="johndoe")
maggie = User(first_name='Maggie', last_name='Turner', email="maggie@turner.com", username="maggie")

db.session.add(john)
db.session.add(maggie)

post1 = Post(title="First post title", body="First post body", user_id=1)
post2 = Post(title="Second post title", body="Second post body", user_id=2)

comment1 = Comment(body="first post comment", user_id=1, post_id=1)
comment2 = Comment(body="second post comment", user_id=2, post_id=2)

db.session.add(post1)
db.session.add(post2)
db.session.add(comment1)
db.session.add(comment2)
db.session.commit()
