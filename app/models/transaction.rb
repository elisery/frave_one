class Transaction < ApplicationRecord
  belongs_to :goal
  # belongs_to :user
  
  validates :title, presence: true 
  validates :amount, presence: true
end
