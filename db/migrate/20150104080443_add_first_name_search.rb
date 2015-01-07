class AddFirstNameSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :first_name, :string
  	add_column :searches, :last_name, :string
  end
end
