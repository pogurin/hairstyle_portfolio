class AddAppointmentAppointment < ActiveRecord::Migration
  def change
  	create_table :appointments do |t|
  		 t.integer :user_id
  		 t.integer :hairdresser_id
  		 t.text    :message
  	  t.timestamps
  	end
  end
end
