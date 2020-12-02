class ArticlesController < ApplicationController
  def show

    # @ converts the regular variable into an instance variable so
    # it can be used in the view(UI)
    
    byebug
    @article = Article.find(params[:id])
  end
end