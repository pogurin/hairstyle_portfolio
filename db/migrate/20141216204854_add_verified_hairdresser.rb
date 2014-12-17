class AddVerifiedHairdresser < ActiveRecord::Migration
  def change
  	  add_column :hairdressers, :verified, :boolean
  end
end
