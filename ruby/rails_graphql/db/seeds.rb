# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  john = User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', username: 'johndoe')
  maggie = User.create(first_name: 'Maggie', last_name: 'Turner', email: 'maggie@doe.com', username: 'maggie')

  10.times do |index|
    Post.create(title: "This is #{index} post title", body: "This is #{index} post body", user: [john, maggie].sample)
  end

  Post.all.each do |post|
    10.times do |index|
      Comment.create(body: "This is comment for post #{post.id}", user: [john, maggie].sample, post: post)
    end
  end
end
