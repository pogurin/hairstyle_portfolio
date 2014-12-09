class AppPictureTohairdresser < ActiveRecord::Migration
  def change
  	add_column :hairdressers, :picture, :string
  end
end
