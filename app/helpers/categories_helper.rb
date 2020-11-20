module CategoriesHelper
  private

  def cat_articles(category)
    category.articles.map do |article|
      article
    end
  end

  def most_recent_article(category)
    articles = category.articles.order(created_at: :desc)
    articles[0]
  end
end
