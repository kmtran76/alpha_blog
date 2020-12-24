class SessionsController < ApplicationController
  
  def new
  
  end

  def create 

    #byebug
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else 
      # Note: we use flash.now instead of just flash since we dont redirect to another page
      # in case of redirect there is a full http request/response cycle but render does not
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end

  end 

  def destroy 
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

end