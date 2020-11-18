module ArticlesHelper
  def main_image(article)
    if article.main_image.attached?
      image_tag article.main_image
    else
      image_tag 'placeholder.png'
    end
  end
end
