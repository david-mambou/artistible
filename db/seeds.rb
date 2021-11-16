# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  name = Faker::Artist.name
  email = Faker::Internet.email(name: name)
  User.create(name: name,
              email: email,
              password: 'password',
              artist: [true, false].sample,
              bio: Faker::Lorem.sentence)
end

User.where(artist: true).each do |user|
  2.times do
    Service.create(user: user,
                   price: rand(2000..20_000),
                   title: Faker::Ancient.hero,
                   description: Faker::Lorem.sentence,
                   category: Faker::Hobby.activity)
  end
end

User.where(artist: false).each do |user|
  start_time = rand(10.years).seconds.from_now
  end_time = start_time + rand(2..6).hour
  Booking.create(start_time: start_time,
                 end_time: end_time,
                 user: user,
                 service: Service.all.sample,
                 status: rand(0..3))
end
