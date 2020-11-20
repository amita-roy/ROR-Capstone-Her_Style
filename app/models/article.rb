class Article < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :votes, foreign_key: 'article_id', dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations, dependent: :destroy

  has_one_attached :image

  validates :title, :text, :createdat, presence: true

  def self.most_voted_article
    article = Article.includes(:votes).sort { |a, b| a.votes.size <=> b.votes.size }.reverse
    article[0]
  end
end
