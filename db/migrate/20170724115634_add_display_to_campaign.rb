class AddDisplayToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :display, :string
  end
end
