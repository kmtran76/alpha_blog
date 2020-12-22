class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
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
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
