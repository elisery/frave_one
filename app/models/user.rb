class User < ApplicationRecord

  has_secure_password

  has_many :goals, dependent: :destroy
  has_many :rewards, dependent: :destroy

  validates :first_name, :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(
    :email, 
    presence: true, 
    uniqueness: true,
    format: VALID_EMAIL_REGEX
  )

  def full_name
    first_name + " " + last_name
  end

 
  
end
