class AddRedirectLinkToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :redirect_link, :string
  end
end
