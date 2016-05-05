# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Post.delete_all

users = []

20.times do

	users << User.create(password: '12345', username: Faker::Internet.user_name, email: Faker::Internet.email)
	
end

users.each do |user|

	3.times do
		Post.create(user_id: user.id, title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
		Comment.create(user_id: user.id, title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
	end

end
