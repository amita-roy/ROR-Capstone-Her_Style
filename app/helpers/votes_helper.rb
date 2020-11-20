module VotesHelper
  private

  def vote?(user, article)
    output = ''

    if user && user.votes?(article)
      output << link_to('Remove vote', article_vote_path(article), method: :delete)
    else
      output << link_to('Vote', article_vote_path(article), method: :post)
    end
    output.html_safe
  end
end
