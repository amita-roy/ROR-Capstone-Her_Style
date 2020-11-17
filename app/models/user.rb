class User < ApplicationRecord
  has_secure_password
  has_many :articles, foreign_key: :author_id
  has_many :votes

  validates :name, presence: true, length: { minimum: 3, maximum: 10 }, uniqueness: true
end
