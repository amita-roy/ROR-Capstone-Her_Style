class Category < ApplicationRecord
  before_save :set_slug
  has_many :categorizations, dependent: :destroy
  has_many :articles, through: :categorizations, dependent: :destroy

  scope :category_order, -> { Category.order(priority: :asc) }

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end
