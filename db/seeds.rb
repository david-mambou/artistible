require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'initialize seed process..'
Service.destroy_all
p 'removing all user accounts'
User.destroy_all
p 'all service instances destroyed'

p 'generating fake users'
20.times do
  name = Faker::Artist.name
  email = Faker::Internet.email(name: name)
  User.create(name: name,
              email: email,
              password: 'password',
              artist: [true, false].sample,
              bio: Faker::Lorem.sentence)
end

p 'populating artists with fake content'
User.where(artist: true).each do |user|
  2.times do
    new_service = Service.create(user: user,
                   price: rand(2000..20_000),
                   title: Faker::Ancient.hero,
                   description: Faker::Lorem.sentence,
                   category: Service::CATEGORIES.sample)

    file = URI.open("https://source.unsplash.com/#{rand(300..500)}x#{rand(300..500)}/?#{new_service.category}")
    file2 = URI.open("https://source.unsplash.com/#{rand(300..500)}x#{rand(300..500)}/?#{new_service.category}")
    file3 = URI.open("https://source.unsplash.com/#{rand(300..500)}x#{rand(300..500)}/?#{new_service.category}")
    new_service.photos.attach(io: file, filename: 'temp.png', content_type: 'image/png')
    new_service.photos.attach(io: file2, filename: 'temp.png', content_type: 'image/png')
    new_service.photos.attach(io: file3, filename: 'temp.png', content_type: 'image/png')
    p 'attached 3 photos from cloudinary..'
    new_service.save
  end
end

p 'populating customers with fake details'
User.where(artist: false).each do |user|
  start_time = rand(10.years).seconds.from_now
  end_time = start_time + rand(2..6).hour
  Booking.create(start_time: start_time,
                 end_time: end_time,
                 user: user,
                 service: Service.all.sample,
                 status: rand(0..3))
end

p 'finished seeding'
