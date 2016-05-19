import graphene

import blog.schema


class Query(blog.schema.Query):
    # This class will inherit from multiple Queries
    # as we begin to add more apps to our project
    pass

schema = graphene.Schema(name='Blog Schema')
schema.query = Query
