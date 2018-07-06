
20.times do |count|
  User.create!(username:              "example_user_#{count}",
               email:                 Faker::Internet.unique.email,
               password:              "foobar",
               password_confirmation: "foobar")

  Account.create!(website: "instagram",
                  username: Faker::Internet.unique.user_name,
                  round_id: 1,
                  user_id: count)

  Comment.create!(text: Faker::MichaelScott.quote,
                  account_id: count)
end
