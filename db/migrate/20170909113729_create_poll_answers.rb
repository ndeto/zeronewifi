class CreatePollAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_answers do |t|
      t.integer :count
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
