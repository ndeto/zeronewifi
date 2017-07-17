class CreateContactTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_types do |t|

      t.timestamps
    end
  end
end
