class AddPriceSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :treatment_price, :integer
	add_column :searches, :perm_price,		:integer
	add_column :searches, :cut_price, 		:integer
	add_column :searches, :perm, 			:string
	add_column :searches, :cut, 			:string
	add_column :searches, :treatment, 		:string
  end
end
