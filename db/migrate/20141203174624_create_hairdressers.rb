class CreateHairdressers < ActiveRecord::Migration
  def change
    create_table :hairdressers do |t|
    	t.string :first_name
    	t.string :last_name
    	t.text :career 
    	t.string :salon_address 
    	t.string :salon_url
    	t.text :personal_message 
    	t.integer :picture_id
    	t.integer :category_id

      t.timestamps
    end
  end
end
