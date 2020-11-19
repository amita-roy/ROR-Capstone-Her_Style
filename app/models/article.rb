class Article < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :votes
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations, dependent: :destroy

  has_one_attached :image

  validates :title, :text, :createdat, presence: true

end
