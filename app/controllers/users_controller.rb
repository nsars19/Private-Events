class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  helper_method :current_user

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    
    session[:current_user_id] = @user.id

    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = current_user.upcoming_events
    @prev_events = current_user.previous_events
  end

  def destroy
    session[:current_user_id] = nil

    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
