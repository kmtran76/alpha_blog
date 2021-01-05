class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end

  def index 
    # use will_paginate gem below https://github.com/mislav/will_paginate
    @categories = Category.paginate(page: params[:page], per_page:2)
  end

  def show 
    @category = Category.find(params[:id])
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end