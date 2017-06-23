class Fixnametoemail < ActiveRecord::Migration[5.0]
  def change
    rename_column :stores, :store_user, :email
  end
end
