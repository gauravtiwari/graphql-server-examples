import graphene
from graphene.contrib.django import DjangoObjectType
from graphene.contrib.django.filter import DjangoFilterConnectionField
from blog.models import Post


class PostType(graphene.ObjectType):
    id = graphene.String()
    title = graphene.String(description='title of the post')
    description = graphene.String(description='description of the post')
    comments = graphene.List('commenttype', description='Comments of the post')
    user = graphene.Field(
        'usertype',
        id=graphene.ID(),
        description='User for this post',
    )
