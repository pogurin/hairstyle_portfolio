class AddLongitudeAndLatitudeToHairdresser < ActiveRecord::Migration
  def change
  	change_table :hairdressers do |t|
  		t.decimal :latitude, precision: 9, scale: 6
  		t.decimal :longitude, precision: 9, scale: 6
  	end
  end
end
