class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :signed_in?

  def require_login
  	unless signed_in? 
  		flash[:error] = "You must sign in to see this page!"
  		redirect_to login_path
  	end
  end

  def skip_if_logged_in
  	if signed_in?
  		redirect_to root_path
  	end
  end


  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
  	!current_user.nil?
  end

  def sign_out
  	@current_user = nil
  end

end
