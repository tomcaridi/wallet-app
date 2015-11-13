class CardUsersController < ApplicationController

  def new
  	@carduser = CardUser.new
  end
 
  def create
  	@user = User.find(params[:id])
  	@card = Card.find(params[:card_id])
  	if CardUser.save(user_id: @user.id, card_id: @card.id)
  	  flash[:notice] = "Card shared"
  	else 
  	  flash[:alert] = "There was an issue"
  	end
    redirect_to user_path(@user)
  end
end