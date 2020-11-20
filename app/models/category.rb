class Category < ApplicationRecord
  before_save :set_slug
  has_many :categorizations, dependent: :destroy
  has_many :articles, through: :categorizations, dependent: :destroy

  scope :category_order, -> { Category.order(priority: :asc) }
  # Ex:- scope :active, -> {where(:active => true)}

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end
