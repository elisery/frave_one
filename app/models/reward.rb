class Reward < ApplicationRecord
  belongs_to :goal
  belongs_to :user
  has_many :reward_items, dependent: :destroy

  accepts_nested_attributes_for :reward_items
end
