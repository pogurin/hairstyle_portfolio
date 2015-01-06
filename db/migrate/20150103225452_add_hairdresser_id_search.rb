class AddHairdresserIdSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :hairdresser_id, :integer
  end
end
