# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "generating tribe"
griffins = Tribe.create!(name: 'the griffins',
  address:'saint-gilles, belgium',
  description:"we love our family.  except meg.",
  subscribed_on: Date.new(2018,02,01))

puts "generating user(s)"
stewie = User.create!(first_name:'stewie', last_name:'griffin', password:'stewieg', tribe: griffins, email:'stewie@gmail.com')
peter = User.create!(first_name:'peter', last_name:'griffin', password:'peterg', tribe: griffins, email:'peter@gmail.com')

puts "generating newspaper"
paper = Newspaper.create!(published_on: Date.new(2018,03,01), tribe:griffins)

puts "generating pages"
6.times do |time|
  Page.create!(layout:1, newspaper: paper)
end

