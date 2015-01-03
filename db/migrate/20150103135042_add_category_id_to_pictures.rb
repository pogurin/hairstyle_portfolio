class AddCategoryIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :category_id, :integer
  end
end
