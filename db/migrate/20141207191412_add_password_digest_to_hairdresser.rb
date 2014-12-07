class AddPasswordDigestToHairdresser < ActiveRecord::Migration
  def change
    add_column :hairdressers, :password_digest, :string
  end
end
