from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
import os


app = Flask(__name__)
app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column('users_id', db.Integer, primary_key=True)
    first_name = db.Column(db.String(60))
    last_name = db.Column(db.String)
    email = db.Column(db.String)
    username = db.Column(db.String)
    posts = db.relationship('Post', backref='user',
                                lazy='dynamic')
    comments = db.relationship('Comment', backref='user',
                                lazy='dynamic')

class Post(db.Model):
    __tablename__ = 'posts'
    id = db.Column('posts_id', db.Integer, primary_key=True)
    title = db.Column(db.String(60))
    body = db.Column(db.String)
    user_id = db.Column('user_id', db.Integer, db.ForeignKey('users.users_id'))
    comments = db.relationship('Comment', backref='post',
                                lazy='dynamic')

class Comment(db.Model):
    __tablename__ = 'comments'
    id = db.Column('comments_id', db.Integer, primary_key=True)
    body = db.Column(db.String)
    user_id = db.Column('user_id', db.Integer, db.ForeignKey('users.users_id'))
    post_id = db.Column('post_id', db.Integer, db.ForeignKey('posts.posts_id'))
