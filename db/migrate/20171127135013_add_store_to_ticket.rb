class AddStoreToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :store, foreign_key: true
  end
end
