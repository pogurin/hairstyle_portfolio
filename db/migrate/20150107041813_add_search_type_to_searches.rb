class AddSearchTypeToSearches < ActiveRecord::Migration
  def change
  	  	  	add_column :searches, :search_type, :string

  end
end
