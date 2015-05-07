# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

num_of_users                   = 20
num_of_challenges              = 40
num_of_comments                = 40
num_of_supporters              = 100
max_num_of_supporters_per_user = 30


num_of_users.times do 
  first_name = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  user_name  = first_name + "_" + last_name
  email      = user_name + "@" + Faker::Internet.domain_name
	User.create(username:   user_name, 
              email:      email, 
              first_name: first_name, 
              last_name:  last_name,

              provider: "facebook",
              uid: "123",
              name: first_name + " " + last_name
             )
end

num_of_challenges.times do
  User.find((rand(num_of_users)+1)).has_proposed.create(victim_id:   (rand(10)+1), 
                                                        title:       Faker::Lorem.word, 
                                                        description: Faker::Lorem.sentence,
                                                        respond_by:  Faker::Time.between(2.days.ago, Time.now),
                                                        complete_by: Faker::Time.forward(5, :morning),
                                                        accepted:    [true, false].sample,
                                                        completed:   false,
                                                        proof_image: Faker::Avatar.image
                                                       )
end

User.all.each do |user|
  if !user.is_victim.empty?
    user.is_victim.each do |challenge|
      if challenge.accepted
        challenge.completed = [true, false].sample
      end
    end
  end
end

num_of_comments.times do
  User.find((rand(num_of_users)+1)).comments.create(challenge_id: (rand(num_of_challenges)+1), 
                                                    text:         Faker::Lorem.sentences((rand(5)+1)))
end

# num_of_supporters.times do 
#   challenges_id = (1..num_of_challenges).to_a
#   User.all.each do |user|
#     rand(max_num_of_supporters_per_user).times do
#       user.supporters.create(challenge_id: challenges_id.delete_at(rand(challenges_id.length)))
#     end
#   end
# end