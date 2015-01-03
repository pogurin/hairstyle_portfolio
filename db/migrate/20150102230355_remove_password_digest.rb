class RemovePasswordDigest < ActiveRecord::Migration
  def change
  	remove_column :hairdressers, :password_digest
  end
end
