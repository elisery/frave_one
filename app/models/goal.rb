class Goal < ApplicationRecord
  belongs_to :user 
  has_many :transactions, dependent: :destroy
  # has_many :rewards, dependent: :destroy
  # has_many :rewards # limit of 4

  validates(:title, presence: true)

  validates(:amount, presence: true, numericality: {greater_than: 0})

  validates_date(:end_date, presence: true, on_or_after: lambda { Date.current } )

  def set_milestones
    milestones = [0.15, 0.30, 0.50, 0.75]
    milestones.each do |ms| 
      reward = Reward.create(milestone: ms)
    end
  end

  def self.goal_totals
    Goal.group("goals.id")
      .order("t_amount desc")
      .includes(:transactions)
      .pluck("goals.title, sum(transactions.amount) as t_amount")
  end

  
end

# def self.most_purchased
#   .group("products.id'")
#   .order("quantity_sum desc").limit(10)
#   .pluck("products.name, sum(line_items.quantity) as quantity_sum")
# end
# def all_weekly_points
#   Week.select("weeks.week_number, sum(point_value * count) AS points")
#       .joins(actions: :play)
#       .where("contestant_id = ?", id)
#       .group("weeks.id")
#       .order("weeks.week_number")
# end
# > User.last.products.most_purchased
# => [["Nsm Og Milk", 28], ["Og Bananas", 19], ["Rr Cheese Pizza", 19], ["Casa Solar Tmprn", 10], ["Og Carrots", 9], ["Olive Bar", 8], ["Atlas Blkbry", 8], ["Mixed Greens Og", 7], ["Tangerine 3 Lb", 7], ["De Lallo Pasta", 7]]