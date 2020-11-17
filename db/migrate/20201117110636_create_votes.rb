class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
