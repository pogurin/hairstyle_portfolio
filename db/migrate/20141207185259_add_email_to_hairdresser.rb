class AddEmailToHairdresser < ActiveRecord::Migration
  def change
    add_column :hairdressers, :email, :string
  end
end
