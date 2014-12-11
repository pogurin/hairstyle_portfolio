class AddStatusHairdresser < ActiveRecord::Migration
  def change
  	add_column :hairdressers, :status, :text
  end
end
