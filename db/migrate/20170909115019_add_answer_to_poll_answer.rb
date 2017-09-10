class AddAnswerToPollAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :poll_answers, :answer, :string
  end
end
