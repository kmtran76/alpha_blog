class ArticlesController < ApplicationController
  def show

    # @ converts the regular variable into an instance variable so
    # it can be used in the view(UI)
    
    # byebug
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    # render plain: params[:article]
    
    # need to whitelist the title and description from article key 
    # otherwise it wont work
    @article = Article.new(params.require(:article).permit(:title, :description))
    
    #render plain: @article.inspect
    @article.save 

    # (rails routes --expanded) tell you the show route is using prefix article
    # to use the prefix you need to append the _path
    redirect_to article_path(@article)

    # shortern path has the same affect as redirect_to article_path(@article)
    # redirect_to @article
  end
end