class AppPictureTopicture < ActiveRecord::Migration
  def change
  	add_column :pictures, :picture, :string
  end
end
