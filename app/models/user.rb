class User < ApplicationRecord
  has_secure_password
  has_many :articles, foreign_key: :author_id
  has_many :votes
  has_many :voted_articles, through: :votes, source: :article

  validates :name, presence: true, length: { minimum: 3, maximum: 10 }, uniqueness: true

  def votes?(article)
    article.votes.where(user_id: id).any?
  end
end
