# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


byebug

 99.times do |n|

  name  = Faker::Name.name

  email = "example-#{n+1}@railstutorial.org"

  password = "password #{n+1}"

  bio = "living life"

  avatar = "beautiful"

  personality_type = 'sativa'

  User.create(username: name, email: email, password: password, bio: bio, avatar: avatar, personality_type: personality_type)

  Strain.new(dispensary_id: 1, avatar: nil, strain_type: nil, strain_name: "redred", location: nil, description: nil)



end
