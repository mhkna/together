#create only initial round
Round.create!

20.times do |count|
  count = count+1
  User.create!(username:              "example_user_#{count}",
               email:                 Faker::Internet.unique.email,
               password:              "foobar",
               password_confirmation: "foobar",
               admin:                 false)

  Account.create!(username: Faker::Internet.unique.user_name,
                  round_id: Round.last.id,
                  user_id: User.last.id,
                  match_amount: 1)

  unless count % 7 == 0
    Comment.create!(text: Faker::TheITCrowd.quote,
                    account_id: Account.last.id)
  end

  if count % 2 == 0
    Comment.create!(text: Faker::StrangerThings.quote,
                    account_id: Account.last.id)
  end

end

puts "Round with 20 Users/Accounts seeded."
