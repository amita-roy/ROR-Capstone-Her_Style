class User < ApplicationRecord
  has_secure_password
  has_many :articles, foreign_key: :author_id
  has_many :votes
  has_many :voted_articles, through: :votes, source: :article

  validates :name, presence: true, length: { minimum: 3, maximum: 10 }, uniqueness: true
  validates :email, presence: true, format: { with: /\w+@\w+\.{1}[a-zA-Z]{2,}/ }, uniqueness: true, length: { minimum: 10, maximum: 30 }
  validates :password, presence: true, length: { minimum: 6, maximum: 10 }

  def votes?(article)
    article.votes.where(user_id: id).any?
  end
end
