class User < ApplicationRecord
  has_secure_password
  has_many :articles
  has_many :votes

  validates :name, presence: true, length: { minimum: 3, maximum: 10 }
end
