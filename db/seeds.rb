#create only initial round
Round.create!

6.times do |count|
  count = count+1
  User.create!(username:              "example_user_#{count}",
               email:                 Faker::Internet.unique.email,
               password:              "foobar",
               password_confirmation: "foobar",
               admin:                 false)

  Account.create!(username: Faker::Internet.unique.user_name,
                  round_id: Round.last.id,
                  user_id: User.last.id,
                  match_amount: 5)


  Comment.create!(text: Faker::TheITCrowd.quote,
                    account_id: Account.last.id)



  Comment.create!(text: Faker::StrangerThings.quote,
                    account_id: Account.last.id)

  3.times do
    Comment.create!(text: "",
                    account_id: Account.last.id)
  end

end

puts "Round with 6 Users/Accounts seeded."
