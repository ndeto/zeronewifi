class AddViewsToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :views, :integer, :default => 0
  end
end
