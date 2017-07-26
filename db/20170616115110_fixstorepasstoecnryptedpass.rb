class Fixstorepasstoecnryptedpass < ActiveRecord::Migration[5.0]
  def change
    rename_column :stores, :password, :encrypted_password
  end
end
