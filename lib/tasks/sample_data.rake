namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    10.times do |n|
      email = "example-#{n+1}@wowapp.org"
      password  = "password"
      User.create!(email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all
    wonders = Wonder.all
    10.times do
      users.each do |user|
        content = Faker::Lorem.sentence(5)
        wonders.each do |wonder| 
          wonder.comments.create!(content: content, user_id: user.id)
        end
      end
    end
  end
end