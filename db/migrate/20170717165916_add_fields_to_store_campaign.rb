class AddFieldsToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :splashpage_status, :boolean
  end
end
