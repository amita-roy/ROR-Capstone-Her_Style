class ArticlesController < ApplicationController
  before_action :require_signin, except: %i[index]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.new
  end

  def show
    # @categories = @article.categories
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
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

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :createdat, :image, category_ids: [])
  end
end
