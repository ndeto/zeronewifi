class AddFbLinkToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :fb_link, :string
  end
end
