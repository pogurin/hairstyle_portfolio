class AddConfirmedAtAppointment < ActiveRecord::Migration
  def change
  	add_column :appointments, :confirmed_at, :datetime 
  end
end
