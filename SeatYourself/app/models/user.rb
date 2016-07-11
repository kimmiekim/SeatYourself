class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :phone,
  validates :email, uniqueness: true

  has_many :reservations
  has_many :restaurants, through: :reservations
end
