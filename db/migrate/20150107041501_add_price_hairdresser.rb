class AddPriceHairdresser < ActiveRecord::Migration
  def change
  	add_column :hairdressers, :treatment_price, :integer
	add_column :hairdressers, :perm_price,		:integer
	add_column :hairdressers, :cut_price, 		:integer
	add_column :hairdressers, :perm, 			:string
	add_column :hairdressers, :cut, 			:string
	add_column :hairdressers, :treatment, 		:string
  end
end
