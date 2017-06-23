class AddKeyToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :key, :string
  end
end
