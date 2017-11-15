class AddBackgroundColorToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :background_color, :string
  end
end
