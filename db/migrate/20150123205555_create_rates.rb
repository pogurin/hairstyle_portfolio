class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :hairdresser_id
      t.integer :rate
      t.integer :service_category_id

      t.timestamps
    end
  end
end
