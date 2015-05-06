# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do 
	User.create(username:  Faker::Internet.user_name, 
              email:     Faker::Internet.email, 
              first_name: Faker::Name.first_name, 
              last_name:  Faker::Name.last_name
             )
end

10.times do
  User.find((rand(10)+1)).victim_challenges.create( victim_id: (rand(10)+1), 
                                                    title: Faker::Lorem.word, 
                                                    description: Faker::Lorem.sentence,
                                                    respond_by: Faker::Time.between(2.days.ago, Time.now),
                                                    complete_by: Faker::Time.forward(5, :morning),
                                                    accepted: [true, false].sample,
                                                    completed: false,
                                                    proof_image: Faker::Avatar.image
                                                  )
end

