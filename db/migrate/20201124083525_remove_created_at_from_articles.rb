class RemoveCreatedAtFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :createdat, :date
  end
end
