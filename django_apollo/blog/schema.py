import graphene

from .models import Post
from .models import Comment
from django.contrib.auth.models import User

from .types.user_type import UserType
from .types.post_type import PostType
from .types.comment_type import CommentType

class Query(graphene.ObjectType):
    all_posts = graphene.List(PostType, description='All posts')
    post = graphene.Field(
        PostType,
        id=graphene.ID(),
        description='Get post by ID',
    )

    def resolve_all_posts(self, args, info):
        return Post.objects.all()
    def resolve_post(self, args, info):
        id = args.get('id')
        return Post.objects.get(pk=id)
    class Meta:
        abstract = True
