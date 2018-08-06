# Demo seeds

PASSWORD = "supersecret"

Transaction.delete_all
Reward.delete_all
Goal.delete_all
User.delete_all
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

users = User.all 
puts Cowsay.say "Created #{users.count} users", :tux

30.times do 
  g = Goal.create(
    title: Faker::Vehicle.make_and_model,
    amount: rand(500...5000),
    user: users.sample,
    end_date: Faker::Time.forward(300, :morning) 
  )
  if g.valid?
    rand(3..20).times do
      Transaction.create(
        title: Faker::Commerce.product_name,
        amount: Faker::Commerce.price,
        created_at: Faker::Time.backward(100, :morning),
        goal: g
      )
    end
    1.times do
      Reward.create(
        title: Faker::Dessert.variety,
        goal: g, 
        user: users.sample
      )
    end
  end
end


goals = Goal.all 
transactions = Transaction.all 
rewards = Reward.all


puts Cowsay.say "Created #{goals.count} goals", :ren
puts Cowsay.say "Created #{transactions.count} transactions", :kitty
puts Cowsay.say "Created #{rewards.count} rewards", :dragon

# ADD FAKER DATA FOR OTHER MODELS
puts "Login with #{super_user.email} and password of '#{PASSWORD}'"
