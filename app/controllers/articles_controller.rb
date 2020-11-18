class ArticlesController < ApplicationController
  before_action :require_signin, except: %i[index]

  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to root_path, notice: 'You have successfully created a new article'
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :createdat)
  end
end
