class RewardSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :goal
  belongs_to :user
  has_many :reward_items

  # accepts_nested_attributes_for :reward_items

  class RewardItemSerializer < ActiveModel::Serializer
    attributes :id, :title, :amount, :milestone, :redeemed 
    belongs_to :reward  
  end
end
