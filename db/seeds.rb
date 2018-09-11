# Demo seeds

PASSWORD = "supersecret"

Transaction.delete_all
RewardItem.delete_all
Reward.delete_all
Goal.delete_all
User.delete_all

super_user = User.create(
  first_name: "Dany", 
  last_name:  "Targaryen",
  email: "dany@dragonstone.gov",
  password: PASSWORD,
  admin: true 
)

# 10.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name

#   User.create(
#     first_name: "#{first_name}",
#     last_name: "#{last_name}",
#     email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
#     password: PASSWORD
#   )
# end

# users = User.all 
# puts Cowsay.say "Created #{users.count} users", :tux

1.times do 
  g = Goal.create(
    title: "Trip to Dublin",
    amount: 3000.00,
    user: super_user,
    end_date: Faker::Time.forward(200, :morning) 
  )
  if g.valid?
    rand(5..10).times do
      t = Faker::Time.backward(100, :morning)
      Transaction.create(
        title: Faker::Commerce.product_name,
        amount: rand(10.00...32.99),
        created_at: t,
        updated_at: t,
        goal: g
      )
    end
    1.times do
      Reward.create(
        # title: g.title?
        title: "#{g.title} Rewards",
        goal: g, 
        user: super_user,
        reward_items_attributes: [
          {
            title: "Netflix Binge",
            milestone: 10,
            amount: 0.00
          },
          {
            title: "Bath bombs",
            milestone: 25, 
            amount: 10.00
          },
          {
            title: "Video Game Day",
            milestone: 50,
            amount: 0.00
          },
          {
            title: "Reading weekend",
            milestone: 75,
            amount: 15.00
          }
        ]
      )
    end
  end
end

1.times do 
  g = Goal.create(
    title: "Furniture",
    amount: 1500.00,
    user: super_user,
    end_date: Faker::Time.forward(150, :morning) 
  )
  if g.valid?
    rand(5..10).times do
      t = Faker::Time.backward(100, :morning)
      Transaction.create(
        title: Faker::Commerce.product_name,
        amount: rand(10.00...32.99),
        created_at: t,
        updated_at: t,
        goal: g
      )
    end
    1.times do
      Reward.create(
        # title: g.title?
        title: "#{g.title} Rewards",
        goal: g, 
        user: super_user,
        reward_items_attributes: [
          {
            title: "Netflix Binge",
            milestone: 10,
            amount: 0.00
          },
          {
            title: "Bath bombs",
            milestone: 25, 
            amount: 10.00
          },
          {
            title: "Video Game Day",
            milestone: 50,
            amount: 0.00
          },
          {
            title: "Reading weekend",
            milestone: 75,
            amount: 15.00
          }
        ]
      )
    end
  end
end

1.times do 
  g = Goal.create(
    title: "Bootcamp",
    amount: 8000.00,
    user: super_user,
    end_date: Faker::Time.forward(280, :morning) 
  )
  if g.valid?
    rand(5..10).times do
      t = Faker::Time.backward(100, :morning)
      Transaction.create(
        title: Faker::Commerce.product_name,
        amount: rand(50.00...82.29),
        created_at: t,
        updated_at: t,
        goal: g
      )
    end
    1.times do
      Reward.create(
        # title: g.title?
        title: "#{g.title} Rewards",
        goal: g, 
        user: super_user,
        reward_items_attributes: [
          {
            title: "Netflix Binge",
            milestone: 10,
            amount: 0.00
          },
          {
            title: "Bath bombs",
            milestone: 25, 
            amount: 10.00
          },
          {
            title: "Video Game Day",
            milestone: 50,
            amount: 0.00
          },
          {
            title: "Reading weekend",
            milestone: 75,
            amount: 15.00
          }
        ]
      )
    end
  end
end

1.times do 
  g = Goal.create(
    title: "Spa Day",
    amount: 300.00,
    user: super_user,
    end_date: Faker::Time.forward(50, :morning) 
  )
  if g.valid?
    rand(2..6).times do
      t = Faker::Time.backward(100, :morning)
      Transaction.create(
        title: Faker::Commerce.product_name,
        amount: rand(5.24...15.43),
        created_at: t,
        updated_at: t,
        goal: g
      )
    end
    1.times do
      Reward.create(
        # title: g.title?
        title: "#{g.title} Rewards",
        goal: g, 
        user: super_user,
        reward_items_attributes: [
          {
            title: "Netflix Binge",
            milestone: 10,
            amount: 0.00
          },
          {
            title: "Bath bombs",
            milestone: 25, 
            amount: 10.00
          },
          {
            title: "Wine",
            milestone: 50,
            amount: 15.00
          },
          {
            title: "Lazy weekend",
            milestone: 75,
            amount: 10.00
          }
        ]
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

puts "Login with #{super_user.email} and password of '#{PASSWORD}'"
