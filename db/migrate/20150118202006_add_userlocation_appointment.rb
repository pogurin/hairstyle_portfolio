class AddUserlocationAppointment < ActiveRecord::Migration
  def change
  	add_column :appointments, :user_location, :string
  end
end
