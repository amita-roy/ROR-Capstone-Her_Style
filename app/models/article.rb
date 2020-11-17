class Article < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :votes
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  # validates :title, :text, :createdat, presence: true
end
