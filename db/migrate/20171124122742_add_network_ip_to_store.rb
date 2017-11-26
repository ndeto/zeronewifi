class AddNetworkIpToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :network_ip, :string
  end
end
