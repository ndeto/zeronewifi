class ChangeDatetoDate < ActiveRecord::Migration[5.0]
  def change
    change_column(:contacts, :date, :date)
  end
end
