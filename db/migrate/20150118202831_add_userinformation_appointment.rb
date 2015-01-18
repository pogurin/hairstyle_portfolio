class AddUserinformationAppointment < ActiveRecord::Migration
  def change
  	add_column :appointments, :user_phone, :integer
  	add_column :appointments, :user_facebook_url, :string
  end
end
