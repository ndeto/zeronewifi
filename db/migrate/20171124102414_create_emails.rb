class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :email
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
