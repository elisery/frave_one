class GoalSerializer < ActiveModel::Serializer
  attributes :id, :title, :amount, :created_at, :end_date
  belongs_to :user

  has_many :transactions
  has_many :rewards
end
