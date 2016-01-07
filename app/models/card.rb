class Card < ActiveRecord::Base
  has_many :card_users
  has_many :users, through: :card_users

  validates :card_number, length: { in: 13..16 }, presence: true, uniqueness: true
  validates :exp_month, inclusion: { in: 1..12 } 
  validates :exp_year, numericality: { greater_than_or_equal_to: Time.now.year }
  validate :card_expired?

  before_save :get_card_type

  def get_card_type
  	if card_number.start_with?("4")
  	  self.card_type = "Visa"
  	elsif card_number.start_with?("34", "37")
  	  self.card_type = "American Express"
  	elsif card_number.start_with?("51", "52", "53", "54", "55")
  	  self.card_type = "MasterCard"
  	elsif card_number.start_with?("6")
  	  self.card_type = "Discover"
  	end
  end

  def card_expired?
    expiration = Time.utc(exp_year, exp_month)
    Time.now.utc > expiration
  end

  # def month_days
  #   mdays = [nil,31,28,31,30,31,30,31,31,30,31,30,31]
  #   mdays[2] = 29 if Date.leap?(year)
  #   mdays[exp_month]
  # end
end