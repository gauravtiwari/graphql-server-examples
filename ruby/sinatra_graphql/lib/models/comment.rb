class Comment < Sequel::Model
  many_to_one :post
  many_to_one :user
end
