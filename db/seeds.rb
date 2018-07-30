# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "supersecret"

User.delete_all
Transaction.delete_all
Goal.delete_all
Reward.delete_all
# DELETE OTHER FAKER DATA

super_user = User.create(
  first_name: "Dany", 
  last_name:  "Targaryen",
  email: "dany@dragonstone.gov",
  password: PASSWORD,
  admin: true 
)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: "#{first_name}",
    last_name: "#{last_name}",
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

100.times do 
  g = Goal.create(
    title: Faker::Vehicle.make_and_model,
    amount: rand(500...5000),
    end_date: Faker::Time.forward(300, :morning) 
  )
  if g.valid?
    rand(3..50).times do
      Transaction.create(
        title: Faker::Commerce.product_name,
        amount: Faker::Commerce.price,
        goal: g
      )
    end
  end
end

users = User.all 
goals = Goal.all 
transactions = Transaction.all 

puts Cowsay.say "Created #{users.count} users", :tux
puts Cowsay.say "Created #{goals.count} goals", :ren
puts Cowsay.say "Created #{transactions.count} transactions", :kitty

# ADD FAKER DATA FOR OTHER MODELS

puts "Login with #{super_user.email} and password of '#{PASSWORD}'"
