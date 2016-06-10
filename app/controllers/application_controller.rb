class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
 #  helper_method :current_user, :log_in

	def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    # return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
end
