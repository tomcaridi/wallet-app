class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
  	@card = Card.all
  end

  def new
  	@card = Card.new
  end

  def create
    id = session[:user_id]
  	@card = Card.new(card_params)
  	if @card.save
      CardUser.create(user_id: session[:user_id], card_id: @card.id)
  	  flash[:notice] = "Card added"
  	else 
  	  flash[:alert] = "There was an issue"
  	end
    redirect_to new_card_path 
  end

  def edit
  end

  def update
    id = session[:user_id]
    @card.update(card_params)
    redirect_to edit_card_path, notice: "Sucessfully updated card."
  end

  def show
  end

  def share
    @share = CardUser.create(user_id: session[:user_id], card_id: @card.id)
    flash[:notice] = "Card shared"
  end

  def destroy
    @card.destroy
    redirect_to user_path(@user)
  end
  
  private
  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:card_number, :exp_month, :exp_year, :balance)
  end
end