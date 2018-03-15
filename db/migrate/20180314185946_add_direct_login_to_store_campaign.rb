class AddDirectLoginToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :direct_login, :boolean
  end
end
