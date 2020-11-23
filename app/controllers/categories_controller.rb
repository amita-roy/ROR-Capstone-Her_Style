class CategoriesController < ApplicationController
  before_action :require_signin, except: %i[index show]

  def index
    @categories = Category.category_order
    @most_voted_article = Article.most_voted_article
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @category = Category.find_by!(slug: params[:id])
    @articles = @category.articles_order
    @row_count = (@articles.length / 2.0).ceil
  end

  private

  def set_category
    @category = Category.find_by!(slug: params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
