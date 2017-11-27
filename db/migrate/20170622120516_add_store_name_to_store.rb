class AddStoreNameToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :store_name, :string
  end
end
