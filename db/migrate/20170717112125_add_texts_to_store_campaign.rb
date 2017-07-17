class AddTextsToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :sponsored_text_status, :boolean
    add_column :store_campaigns, :sponsored_text, :string
    add_column :store_campaigns, :campaign_text_status, :boolean
    add_column :store_campaigns, :campaign_text, :string
    add_column :store_campaigns, :media, :string
  end
end
