class Article < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
end
