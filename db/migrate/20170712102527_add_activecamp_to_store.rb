class AddActivecampToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :activecamp, :string
  end
end
