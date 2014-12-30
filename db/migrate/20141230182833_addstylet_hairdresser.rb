class AddstyletHairdresser < ActiveRecord::Migration
  def change
  	add_column :hairdressers, :area, 	:string
  	add_column :hairdressers, :style, 	:string
  	add_column :hairdressers, :price, 	:integer
  end
end
