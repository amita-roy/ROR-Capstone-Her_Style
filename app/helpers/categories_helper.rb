module CategoriesHelper
  private

  def cat_articles(category)
    category.articles.map do |article|
      article
    end
  end
end
