# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# num_of_users                   = 20
# num_of_challenges              = 40
# num_of_comments                = 40
# num_of_supporters              = 100
# max_num_of_supporters_per_user = 30




# num_of_users.times do 
#   first_name = Faker::Name.first_name
#   last_name  = Faker::Name.last_name
#   user_name  = first_name + "_" + last_name
#   email      = user_name + "@" + Faker::Internet.domain_name
# 	User.create(username:   user_name, 
#               email:      email, 
#               first_name: first_name, 
#               last_name:  last_name,

#               provider: "facebook",
#               uid: "123",
#               name: first_name + " " + last_name
#              )
# end

# num_of_challenges.times do
#   User.find((rand(num_of_users)+1)).has_proposed.create(victim_id:   (rand(10)+1), 
#                                                         title:       Faker::Lorem.word, 
#                                                         description: Faker::Lorem.sentence,
#                                                         respond_by:  Faker::Time.between(2.days.ago, Time.now),
#                                                         complete_by: Faker::Time.forward(5, :morning),
#                                                         accepted:    [true, false].sample,
#                                                         completed:   false,
#                                                         proof_image: Faker::Avatar.image
#                                                        )
# end

# User.all.each do |user|
#   if !user.is_victim.empty?
#     user.is_victim.each do |challenge|
#       if challenge.accepted
#         challenge.completed = [true, false].sample
#       end
#     end
#   end
# end

# num_of_comments.times do
#   User.find((rand(num_of_users)+1)).comments.create(challenge_id: (rand(num_of_challenges)+1), 
#                                                     text:         Faker::Lorem.sentences((rand(5)+1)))
# end

# num_of_supporters.times do 
#   challenges_id = (1..num_of_challenges).to_a
#   User.all.each do |user|
#     rand(max_num_of_supporters_per_user).times do
#       user.supporters.create(challenge_id: challenges_id.delete_at(rand(challenges_id.length)))
#     end
#   end
# end

#1
User.create(first_name:   "Marko",
            last_name:    "Potocnik",
            name:         "Marko Potocnik")
#2
User.create(first_name:   "Bob",
            last_name:    "Dole",
            name:         "Bob Dole")
#3
User.create(first_name:   "Joe",
            last_name:    "Jammer",
            name:         "Joe Jammer")
#4
User.create(first_name:   "Tom",
            last_name:    "Brady",
            name:         "Tom Brady")
#5
User.create(first_name:   "Dan",
            last_name:    "Miller",
            name:         "Dan Miller")
#6
User.create(first_name:   "Robin",
            last_name:    "Liu",
            name:         "Robin Liu")





# 3 Open Challenges

# I challenge someone to can climb Mt Everest!

Challenge.create(proposer_id: 1,
                 description: "I challenge someone to climb Mt Everest!")
Supporter.create(challenge_id: 1,
                 user_id: 2)
Comment.create(challenge_id: 1,
                user_id: 2,
                text: "Dan Miller, are you up to the task?")
Comment.create(challenge_id: 1,
                user_id: 5,
                text: "uhh, this is quite a challenge! Maybe Once I'm done with school")

# I challenge Bob to do 50 pull ups

Challenge.create(proposer_id: 3,
                 description: "I challenge Bob to do 50 pull ups")
Supporter.create(challenge_id: 2,
                 user_id: 2)
Supporter.create(challenge_id: 2,
                  user_id: 3)

# I challenge someone to ride up Hawk Hill with me! 

Challenge.create(proposer_id: 6,
                 description: "I challenge someone to ride up Hawk Hill with me!")


# 3 Accepted Challenges

# I challenge Marko to fart in front Brittany!

Challenge.create(proposer_id: 3,
                  victim_id: 1,
                 description: "I challenge Marko to fart in front Brittany!",
                 status: "Accepted")
Supporter.create(challenge_id: 4,
                 user_id: 2)
Supporter.create(challenge_id: 4,
                  user_id: 3)
Comment.create(challenge_id: 4,
                user_id: 5,
                text: "LOL this would be hilarious!")


# I challenge Joe to get all A's this semester!

Challenge.create(proposer_id: 5,
                  victim_id: 3,
                 description: "I challenge Joe to get all A's this semester!",
                 status: "Accepted")
Supporter.create(challenge_id: 5,
                 user_id: 1)
Supporter.create(challenge_id: 5,
                  user_id: 2)
Supporter.create(challenge_id: 5,
                  user_id: 4)
Supporter.create(challenge_id: 5,
                  user_id: 6)
Supporter.create(challenge_id: 5,
                  user_id: 4)
Comment.create(challenge_id: 5,
                user_id: 5,
                text: "You got this Joe!")
Comment.create(challenge_id: 5,
                user_id: 6,
                text: "Nice")


# I don't think anyone can run the mile tomorrow in under 7 minutes! 

Challenge.create(proposer_id: 5,
                  victim_id: 6,
                 description: "I don't think anyone can run the mile tomorrow in under 7 minutes!",
                 status: "Accepted")
Comment.create(challenge_id: 6,
                user_id: 6,
                text: "I got this")


# 3 Rejected Challenges

# I don't think Tom can eat 10 Big Macs!

Challenge.create(proposer_id: 1,
                  victim_id: 4,
                 description: "I don't think Tom can eat 10 Big Macs!",
                 status: "Rejected")


# I challenge Joe to drive 101 mph down highway 101

Challenge.create(proposer_id: 1,
                  victim_id: 3,
                 description: "I challenge Joe to drive 101 mph down highway 101",
                 status: "Rejected")
Comment.create(challenge_id: 8,
                user_id: 3,
                text: "That's a horrible idea")

# I challenge Bill to give Bao 50 dollars

Challenge.create(proposer_id: 3,
                  victim_id: 1,
                 description: "I challenge Marko to give Joe 50 dollars",
                 status: "Rejected")
Comment.create(challenge_id: 9,
                user_id: 1,
                text: "How about... no!")


# 3 Completed Challenges

# I challenge Danh Trang to run the Boston Marathon!

Challenge.create(proposer_id: 5,
                  victim_id: 6,
                 description: "I challenge Robin to finish Law School!",
                 status: "Completed")
Supporter.create(challenge_id: 10,
                 user_id: 1)
Supporter.create(challenge_id: 10,
                  user_id: 2)
Supporter.create(challenge_id: 10,
                  user_id: 4)
Supporter.create(challenge_id: 10,
                  user_id: 6)
Supporter.create(challenge_id: 10,
                  user_id: 4)
Comment.create(challenge_id: 10,
                user_id: 6,
                text: "I graduated!",
                completionmsg: true)
Comment.create(challenge_id: 10,
                user_id: 1,
                text: "congratulations!")



# I challenge Robin to finish Law School!

Challenge.create(proposer_id: 5,
                  victim_id: 6,
                 description: "I challenge Dan Miller to run the Boston Marathon!",
                 status: "Completed")
Supporter.create(challenge_id: 11,
                  user_id: 4)
Supporter.create(challenge_id: 11,
                  user_id: 6)
Supporter.create(challenge_id: 11,
                  user_id: 4)
Comment.create(challenge_id: 11,
                user_id: 6,
                text: "Did it! Wasn't too bad guys!",
                completionmsg: true)
Comment.create(challenge_id: 11,
                user_id: 1,
                text: "congratulations!")
Comment.create(challenge_id: 11,
                user_id: 5,
                text: "Good job Dan!")







# I 

# 3 Failed Challenges

