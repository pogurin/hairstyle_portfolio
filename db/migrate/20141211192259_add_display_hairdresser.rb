class AddDisplayHairdresser < ActiveRecord::Migration
  def change
  	add_column :hairdressers, :available, :boolean
  end
end
