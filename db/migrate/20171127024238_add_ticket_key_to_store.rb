class AddTicketKeyToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :ticket_key, :string
  end
end
