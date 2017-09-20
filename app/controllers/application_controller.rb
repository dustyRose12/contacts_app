class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user #helper methods appear directly underneath the current method.  this makes it a keyword that we can access anywhere in the controller or the view. when they sign in they get the user object from the database, not just the id.

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

end
