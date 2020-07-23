class ApplicationController < ActionController::Base
  before_action :require_login
  
  def current_user
    return unless session[:current_user_id]
    @current_user = User.find(session[:current_user_id])
  end

  def require_login
    return if session[:current_user_id]

    redirect_to new_user_path
  end
end
