class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.password == params[:password]
        session[:user_id] = @user.id
        flash[:notice] = "You have logged in successfully"
        redirect_to user_path(@user)
    else
      flash[:alert] = "Your information was incorrect."
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have signed out"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
