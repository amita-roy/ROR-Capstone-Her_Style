class Article < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :votes
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_one_attached :image

  validates :title, :text, :createdat, presence: true

  scope :fashion, -> { where(:category => 'fashion')}
  scope :cosmetics, -> { where(:category => 'cosmetics')}
  scope :business, -> { where(:category => 'business ')}
  scope :worklife, -> { where(:category => 'worklife')}
  # Ex:- scope :active, -> {where(:active => true)}
end
