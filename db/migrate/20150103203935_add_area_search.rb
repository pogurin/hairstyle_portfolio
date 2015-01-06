class AddAreaSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :area, :string
  end
end
