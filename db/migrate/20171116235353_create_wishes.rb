class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :notification

      t.timestamps null: false
    end
  end
end
