class AddCategoryIdSearch2 < ActiveRecord::Migration
  def change
  	add_column :searches, :style, :string
 	add_column :searches, :price, :integer
 	add_column :searches, :category_id, :integer
  end
end
