class AddNumberOfUseToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :number_of_use, :int
  end
end
