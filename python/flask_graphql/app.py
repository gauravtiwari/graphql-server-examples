from schema import schema
from models import app
from flask_graphql import GraphQLView

app.add_url_rule('/', view_func=GraphQLView.as_view('graphql', schema=schema, graphiql=True))

if __name__ == '__main__':
    app.run()
