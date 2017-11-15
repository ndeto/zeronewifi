class AddActiveToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :active, :boolean
  end
end
