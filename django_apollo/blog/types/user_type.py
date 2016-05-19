import graphene
from graphene.contrib.django import DjangoObjectType
from django.contrib.auth.models import User


class UserType(graphene.ObjectType):
    id = graphene.String()
    first_name = graphene.String(description='first name of the user')
    last_name = graphene.String(description='last name of the user')
    email = graphene.String(description='email of the user')
    username = graphene.String(description='username of the user')
    posts = graphene.List('posttype', description='Posts of this user')
