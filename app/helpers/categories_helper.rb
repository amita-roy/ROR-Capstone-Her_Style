module CategoriesHelper
  private

  def cat_articles(category)
    category.articles.map do |article|
      article
    end
  end

  def category_background(category)
    article = category.most_recent_article
    article ? rails_blob_url(article.image) : ''
  end

  def most_voted_article_image(article)
    rails_blob_url(article.image)
  end
end
