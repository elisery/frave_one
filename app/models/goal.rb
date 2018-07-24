class Goal < ApplicationRecord
  # belongs_to :user 

  validates(:title, presence: true)

  validates(:amount, presence: true, numericality: {greater_than: 0})

  validates_date(:end_date, presence: true, on_or_after: lambda { Date.current } )

end
