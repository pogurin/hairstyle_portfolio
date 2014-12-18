class AddMemberIdHairdresser < ActiveRecord::Migration
  def change
  	  add_column :hairdressers, :member_ID, :string
  end
end
	