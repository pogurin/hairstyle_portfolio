class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :category_id
      t.integer :minimum_price
      t.integer :maximum_price
      t.string :area

      t.timestamps
    end
  end
end
