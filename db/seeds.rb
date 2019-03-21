# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "generating tribe"
  peeters = Tribe.create!(name: 'Peeters Family',
  address:'Saint-Gilles, Belgium',
  description:"We Love our Family ! ",
  subscribed_on: Date.new(2018,02,01),
  remote_photo_url: "https://res.cloudinary.com/df0udw5lo/image/upload/v1553102723/mvfpkfeimx1bjnimsdd1.jpg")

puts "generating newspaper"
puts "generating pages"

  newspaper = Newspaper.create(published_on: Date.today.end_of_month, tribe_id: 1)
    (1..12).each do |number|
      if number == 1
        var_page = newspaper.pages.create(number: number.to_s, layout: "0")
      else
      var_page = newspaper.pages.create(number: number.to_s, layout: "3")
    end
      9.times do |box|
        var_page.boxes.create
      end
      var_page.boxes.create(category: "text")
    end



puts "generating user(s)"
carole = User.create!(first_name:'Carole', last_name:'Peeters', password:'carole', tribe_id: 1, email:'carole@gmail.com', remote_photo_url: "https://res.cloudinary.com/df0udw5lo/image/upload/v1553102583/vsv5gzlx929um2ekn3fp.jpg" )
thomas = User.create!(first_name:'Thomas', last_name:'Peeters', password:'thomas', tribe_id: 1, email:'thomas@gmail.com', remote_photo_url: "https://res.cloudinary.com/df0udw5lo/image/upload/v1553102620/purwzgooqkqqgyqyqkxj.png")
nathalie = User.create!(first_name:'Nathalie', last_name:'Dubois', password:'nathalie', tribe_id: 1, email:'nathalie@gmail.com',remote_photo_url:"https://res.cloudinary.com/df0udw5lo/image/upload/v1553102655/t2wy9qjeml6dzcvynuq2.jpg" )
bob = User.create!(first_name:'Bob', last_name:'Dubois', password:'bobbob', tribe_id: 1, email:'bob@gmail.com', remote_photo_url: "https://res.cloudinary.com/df0udw5lo/image/upload/v1553102692/csl6xtpfgevrnxiqyhki.jpg")
