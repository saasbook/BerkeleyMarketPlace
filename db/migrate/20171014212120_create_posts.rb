class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :price
      t.text :description
      t.datetime :release_time
      t.datetime :expire_time
      t.integer :author_id
      t.string :category
      t.string :subcategory
      t.boolean :available
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps null: false
    end
  end
end
