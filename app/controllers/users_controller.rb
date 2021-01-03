class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Note: 1. ordering of these 2 are important since the code execute in a top down format
  #       2. require_user is a helper method in application_controller.rb 
  #       3. require_same_user is just a private method
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show    
    # @articles = @user.articles
    # use will_paginate gem below https://github.com/mislav/will_paginate
    @articles =  @user.articles.paginate(page: params[:page], per_page:2)
  end

  def index
    # @users = User.all
    # use will_paginate gem below https://github.com/mislav/will_paginate
    @users = User.paginate(page: params[:page], per_page:2)
  end 

  def new
    @user = User.new
  end

  def edit 
    
  end 

  def update    
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user      # Note: @user is short for user_path
    else
      render 'edit'
    end
  end 

  def create
    #byebug
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def destroy 
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end 
  end 
end
