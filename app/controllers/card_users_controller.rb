class CardUsersController < ApplicationController

  def new
  	@carduser = CardUser.new
  end
 
  def create
    @user = User.where(email: params[:email]).first
  	@card = Card.find(params[:id])
  	if CardUser.create(user_id: @user.id, card_id: @card.id)
  	  flash[:notice] = "Card shared"
  	else 
  	  flash[:alert] = "There was an issue"
  	end
    redirect_to user_path(session[:user_id])
  end
end