# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixGraphql.Repo.insert!(%PhoenixGraphql.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

user = PhoenixGraphql.Repo.insert!(%PhoenixGraphql.User{first_name: "John", last_name: "Doe", email: "john@doe.com", username: "john"})

post1 = PhoenixGraphql.Repo.insert!(%PhoenixGraphql.Post{title: "My Unarmed Son Was Killed by Police", body: "Money doesn’t bring a life back. It won’t bring back my son. In our case we got the satisfaction of a settlement but no admission of guilt; it was a hollow victory.", user: user})
post2 = PhoenixGraphql.Repo.insert!(%PhoenixGraphql.Post{title: "Memo to Nest: How 3 connected hardware companies killed their devices", body: "This week’s biggest news so far has been Nest’s decision to kill off Revolv, a smart home hub product that Nest purchased in 2014. At the time of the October 2014 acquisition, Revolv told its users that the deal meant Revolv would stop selling its $299 hub and customer support would stop in a year. A few days ago, users learned that Nest was not only ceasing support but that their devices would stop working on May 15, 2016.", user: user})

comment1 = PhoenixGraphql.Repo.insert!(%PhoenixGraphql.Comment{body: "Comment for post1: This week’s biggest news so far has been Nest’s decision to kill off Revolv, a smart home hub product that Nest purchased in 2014. At the time of the October 2014 acquisition, Revolv told its users that the deal meant Revolv would stop selling its $299 hub and customer support would stop in a year. A few days ago, users learned that Nest was not only ceasing support but that their devices would stop working on May 15, 2016.", user: user, post: post1})

comment2 = PhoenixGraphql.Repo.insert!(%PhoenixGraphql.Comment{body: "Comment for post2: This week’s biggest news so far has been Nest’s decision to kill off Revolv, a smart home hub product that Nest purchased in 2014. At the time of the October 2014 acquisition, Revolv told its users that the deal meant Revolv would stop selling its $299 hub and customer support would stop in a year. A few days ago, users learned that Nest was not only ceasing support but that their devices would stop working on May 15, 2016.", user: user, post: post2})
