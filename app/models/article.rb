class Article < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :votes, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations, dependent: :destroy

  has_one_attached :image

  validates :title, :text, :createdat, :image, :categories, presence: true
  validates :title, length: { minimum: 5, maximum: 200 }, uniqueness: true

  def self.most_voted_article
    articles = Article.includes(:votes).sort { |a, b| b.votes.size <=> a.votes.size }
    articles.first
  end
end
