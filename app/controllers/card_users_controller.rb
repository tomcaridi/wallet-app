class CardUsersController < ApplicationController

  def share
  	if email.present? = true
    CardUser.create(user_id: session[:user_id], card_id: @card.id)
    flash[:notice] = "Card shared"
  end

end
