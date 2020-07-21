class UsersController < ApplicationController
  #before_action: :user_login

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    
    session[:current_user_id] = @user.id
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
