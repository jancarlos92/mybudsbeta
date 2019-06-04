# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


 99.times do |n|

  name  = Faker::Name.name

  email = "example-#{n+1}@railstutorial.org"

  password = "password #{n+1}"

  bio = "living life"

  avatar = "beautiful"

  personality_type = 'string'

  User.create(username: name, email: email, password: password, bio: bio, avatar: avatar, personality_type: personality_type)

  # User.create(username: 'username', email: 'email@emde.com', password: 'passwo
  # rder12', bio: 'bio', avatar: 'avatar', personality_type: 'sativa')

end
