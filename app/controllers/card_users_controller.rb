class CardUsersController < ApplicationController

  def new
  	@carduser = CardUser.new
  end
 
  def create
    @user = User.where(email: params[:email]).first
  	@card = Card.find(params[:id])
  	if CardUser.create(user_id: @user.id, card_id: @card.id)
  	  flash[:notice] = "Card shared"
      redirect_to user_path(session[:user_id])
  	else 
  	  flash[:alert] = "There was an issue"
      redirect_to share_path(card.id)
  	end
  end
end