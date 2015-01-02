class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
    	t.string :name
    	t.integer :price_in_cents
    	t.integer :hairdresser_id
      t.timestamps
    end
  end
end
