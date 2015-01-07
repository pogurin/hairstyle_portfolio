class CreateSearchPictures < ActiveRecord::Migration
  def change
    create_table :search_pictures do |t|
      t.integer :category_id
      t.integer :picture_id

      t.timestamps
    end
  end
end
