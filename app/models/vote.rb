class Vote < ApplicationRecord
  belongs_to :user, class_name: 'user', foreign_key: 'user_id'
  belongs_to :article, class_name: 'article', foreign_key: 'article_id'
end
