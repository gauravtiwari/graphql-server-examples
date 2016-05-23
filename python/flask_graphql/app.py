from flask import Flask

from database import db_session, init_db
from flask_graphql import GraphQL
from schema import schema

app = Flask(__name__)
app.debug = True
