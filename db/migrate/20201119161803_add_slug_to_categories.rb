class AddSlugToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :slug, :string
  end
end
