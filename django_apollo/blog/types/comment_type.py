import graphene
from graphene.contrib.django import DjangoObjectType

from blog.models import Comment


class CommentType(graphene.ObjectType):
    id = graphene.String()
    body = graphene.String(description='body of the comment')
    user = graphene.Field(
        'usertype',
        id=graphene.ID(),
        description='User for this comment',
    )
