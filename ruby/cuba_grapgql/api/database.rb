require 'rubygems'
require 'data_mapper'

DataMapper.setup(:default, 'postgres://gaurav@localhost/cuba_graphql')

# Here's an example User model
class User
  include DataMapper::Resource

  property :id,         Serial
  property :first_name,      String
  property :last_name,      String
  property :email,      String
  property :username,      String
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :posts
  has n, :comments
end

class Post
  include DataMapper::Resource
  property :user_id, Integer,  :required => true, index: true

  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :body,       Text      # A text block, for longer string data.
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :comments
  belongs_to :user
end

class Comment
  include DataMapper::Resource

  property :id,         Serial
  property :body,       Text
  property :user_id, Integer, :required => true, index: true
  property :post_id, Integer, :required => true, index: true
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :post
  belongs_to :user
end

DataMapper.finalize.auto_upgrade!


user1 = User.create(
  first_name: 'John',
  last_name: 'Doe',
  email: 'john@doe.com',
  username: 'johndoe',
  created_at: Time.now,
  updated_at: Time.now
)

user2 = User.create(
  first_name: 'Maggie',
  last_name: 'Turner',
  email: 'maggie@turner.com',
  username: 'maggie',
  created_at: Time.now,
  updated_at: Time.now
)

post1 = Post.create(
  title: "First post title",
  body: "First post body",
  user: user1,
  created_at: Time.now,
  updated_at: Time.now
)

post2 = Post.create(
  title: "Second post title",
  body: "Second post body",
  user: user2,
  created_at: Time.now,
  updated_at: Time.now
)

comment1 = Comment.create(
  body: "First post body",
  user: user1,
  post: post1,
  created_at: Time.now,
  updated_at: Time.now
)

comment2 = Comment.create(
  body: "First post body",
  user: user2,
  post: post2,
  created_at: Time.now,
  updated_at: Time.now
)
