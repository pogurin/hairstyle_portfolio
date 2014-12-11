class AddDisplayHairdresser < ActiveRecord::Migration
  def change
  	add_column :hairdressers, :display, :integer
  end
end
