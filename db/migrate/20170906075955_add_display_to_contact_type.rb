class AddDisplayToContactType < ActiveRecord::Migration[5.0]
  def change
    add_column :contact_types, :display, :string
  end
end
