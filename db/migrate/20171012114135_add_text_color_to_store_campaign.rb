class AddTextColorToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :text_color, :string
  end
end
