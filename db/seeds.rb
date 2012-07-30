# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#franzl = Users.create({ username: "franzl", email: "franzl@gmail.com", password: "test1234"})

# ActiveRecord::Base.establish_connection
# ActiveRecord::Base.connection.tables.each do |table|
#   ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
# end


def random_string
  ('a'..'z').to_a.shuffle[0..7].join
end


u = User.create!({:email => "guy@gmail.com", :username=>"Guy1234" , :password => "111111", :password_confirmation => "111111" })
u2 = User.create!({:email => "anotherguy@gmail.com", :username=>"AnotherGuy5678" , :password => "111111", :password_confirmation => "111111" })
20.times do
  Post.create({:title => (random_string), :link=>'http://www.google.com', :user_id => u.id})
end
20.times do
  Post.create({:title => random_string, :link=>'http://www.youtube.com', :user_id => u2.id})
end