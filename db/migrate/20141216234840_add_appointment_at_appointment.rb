class AddAppointmentAtAppointment < ActiveRecord::Migration
  def change
  	add_column :appointments, :appointment_at, :datetime 
  end
end
