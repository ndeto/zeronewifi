class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.references :store, foreign_key: true
      t.integer :phone
      t.datetime :date

      t.timestamps
    end
  end
end
