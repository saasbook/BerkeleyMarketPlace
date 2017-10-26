class RemoveImgNameFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :img_name, :string
  end
end
