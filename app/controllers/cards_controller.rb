class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
  	@card = Card.all
  end

  def new
  	@card = Card.new
  end

  def create
    @user = session[:user_id]
  	@card = Card.new(card_params)
  	if @card.save
      CardUser.create(user_id: session[:user_id], card_id: @card.id)
  	  flash[:notice] = "Card successfully added"
      redirect_to user_path(@user)
  	else 
  	  flash[:alert] = "There was an issue adding the card"
      render :new
  	end
  end

  def edit
  end

  def update
    @user = session[:user_id]
    @card.update(card_params)
    redirect_to user_path(@user), notice: "Sucessfully updated card."
  end

  def show
  end

  def destroy
    @card.destroy
    @user = session[:user_id]
    redirect_to user_path(@user)
    flash[:notice] = "Card successfully deleted"
  end
  
  private
  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:card_number, :exp_month, :exp_year, :balance)
  end
end