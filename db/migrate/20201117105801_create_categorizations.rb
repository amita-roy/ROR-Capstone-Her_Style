class CreateCategorizations < ActiveRecord::Migration[6.1]
  def change
    create_table :categorizations do |t|
      t.references :article, null: false, foreign_key: true, on_delete: :cascade
      t.references :category, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
