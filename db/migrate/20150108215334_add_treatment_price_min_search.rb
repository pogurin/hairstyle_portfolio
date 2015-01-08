class AddTreatmentPriceMinSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :cut_price_min, :integer
  	add_column :searches, :perm_price_min, :integer
  	add_column :searches, :treatment_price_min, :integer
  end
end
