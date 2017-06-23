class AddUsernameToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :username, :string
  end
end
