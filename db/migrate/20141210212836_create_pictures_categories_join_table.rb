class CreatePicturesCategoriesJoinTable < ActiveRecord::Migration
  def change
  	create_table :categories_pictures, id: false do |t|
      t.integer :picture_id
      t.integer :category_id
    end
  end
end
