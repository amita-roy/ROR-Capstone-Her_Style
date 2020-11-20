module VotesHelper
  private

  def vote?(user, article)
    output = ''

    if user && user.votes?(article)
      output << link_to('Remove vote', article_vote_path(article), method: :delete, remote: true)
    else
      output << link_to('Vote', article_vote_path(article), method: :post, remote: true)
    end
    output.html_safe
  end
end
