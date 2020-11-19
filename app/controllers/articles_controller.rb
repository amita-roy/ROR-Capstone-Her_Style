class ArticlesController < ApplicationController
  before_action :require_signin, except: %i[index]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.send(articles_filter)
    @categories = Category.all
  end

  def new
    @article = current_user.articles.new
  end

  def show
    @categories = @article.categories
    @vote = current_user.votes.find_by(article_id: @article.id) if current_user
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

  def articles_filter
    if params[:filter].in? %w[fashion cosmetics worklife business]
      params[:filter]
    else
      :all
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :createdat, :image, category_ids: [])
  end
end
