class Goal < ApplicationRecord
  belongs_to :user 
  has_many :transactions, dependent: :destroy
  has_many :rewards, dependent: :destroy
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

