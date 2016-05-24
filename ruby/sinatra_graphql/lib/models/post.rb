class Post < Sequel::Model
  one_to_many :comments
  many_to_one :user
end
