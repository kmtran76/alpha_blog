class ArticlesController < ApplicationController
  
  # this help with DRY (don't repeat yourself) scheme
  # mean run set_article method before any other action
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show

    # @ converts the regular variable into an instance variable so
    # it can be used in the view(UI)
    
    # byebug
    
    # comment out because we use before_action above
    # @article = Article.find(params[:id])          
  end

  def index
    @articles = Article.all
  end

  def new
    # this is for the validation to not complain
    # when first time load the new.html.erb 
    @article = Article.new
  end

  def edit
    # byebug
    # comment out because we use before_action above
    # @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]
    
    # need to whitelist the title and description from article key 
    # otherwise it wont work
    @article = Article.new(article_params)
    @article.user = User.first

    #render plain: @article.inspect
    if @article.save 
      # another one is flash[:alert], use to alert if something goes wrong
      flash[:notice] = "Article was created sucessfully."

      # (rails routes --expanded) tell you the show route is using prefix article
      # to use the prefix you need to append the _path
      redirect_to article_path(@article)

      # shortern path has the same affect as redirect_to article_path(@article)
      # redirect_to @article
    else
      render 'new'
    end
  end

  def update
    # comment out because we use before_action above
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated sucessfully."
      redirect_to article_path(@article)
    else 
      render 'edit'
    end
  end

  def destroy 
    # comment out because we use before_action above
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  # anything below this is private
  # these methods help reduce redundancy or DRY
  private

  def set_article
    @article = Article.find(params[:id]) 
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end