class AddFieldsToContactType < ActiveRecord::Migration[5.0]
  def change
    add_column :contact_types, :name, :string
    add_column :contact_types, :description, :string
  end
end
