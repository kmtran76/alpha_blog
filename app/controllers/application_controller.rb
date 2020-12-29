class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user    
    # if session[:user_id]
    #   User.find(session[:user_id])
    # end
    # Another way of writing the above is:
    # User.find(session[:user_id]) if session[:user_id]

    # the ||= mean only hit the db if @current_user is not available
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # the !! mean to turn something into a boolean.  In this case turn the current_user
    # into a boolean.  Will return true or false base on current_user
    !!current_user
  end
end
