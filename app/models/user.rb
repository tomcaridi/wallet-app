class User < ActiveRecord::Base
  has_many :card_users
  has_many :cards, through: :card_users
  
  validates :firstname, :lastname, :email, :password, :phone, presence: true
  validates :password, length: {minimum: 4}
  validates :password, confirmation: true
  validates :phone, numericality: {only_integer: true}
  validates :phone, length: {is: 10}
  validates_uniqueness_of :email
end
