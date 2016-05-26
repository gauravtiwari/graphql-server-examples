import graphene

from models import Post
from models import Comment
from models import User

schema = graphene.Schema(name='Blog Schema')

@schema.register
class CommentType(graphene.ObjectType):
    id = graphene.String()
    body = graphene.String(description='body of the comment')
    user = graphene.Field(
        'UserType',
        id=graphene.ID(),
        description='User for this comment',
    )

@schema.register
class PostType(graphene.ObjectType):
    id = graphene.String()
    title = graphene.String(description='title of the post')
    body = graphene.String(description='body of the post')
    comments = graphene.List(graphene.LazyType(lambda _: CommentType))
    user = graphene.Field(
        'UserType',
        id=graphene.ID(),
        description='User for this post',
    )
    @classmethod
    def resolve_comments(cls, obj, input, info):
      return obj.comments.all()

@schema.register
class UserType(graphene.ObjectType):
    id = graphene.String()
    first_name = graphene.String(description='first name of the user')
    last_name = graphene.String(description='last name of the user')
    email = graphene.String(description='email of the user')
    username = graphene.String(description='username of the user')
    posts = graphene.List(graphene.LazyType(lambda _: PostType))
    comments = graphene.List(graphene.LazyType(lambda _: CommentType))


class Query(graphene.ObjectType):
    all_posts = graphene.List('PostType', description='All posts')
    post = graphene.Field(
        'PostType',
        id=graphene.ID(),
        description='Get post by ID',
    )
    user = graphene.Field(
        'UserType',
        id=graphene.ID(),
        description='Get user by ID',
    )

    def resolve_all_posts(self, args, info):
        return Post.query.all()
    def resolve_post(self, args, info):
        id = args.get('id')
        return Post.query.get(id)
    def resolve_user(self, args, info):
        id = args.get('id')
        return User.query.get(id)

schema.query = Query
