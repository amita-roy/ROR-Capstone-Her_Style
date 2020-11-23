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

  def article_image(article)
    if article
      rails_blob_url(article.image)
    end
  end
end
