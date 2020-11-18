module ArticlesHelper
  def image(article)
    if article.image.attached?
      image_tag article.image
    else
      image_tag 'placeholder.png'
    end
  end
end
