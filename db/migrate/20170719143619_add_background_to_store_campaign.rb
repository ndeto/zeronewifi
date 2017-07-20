class AddBackgroundToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :background, :string
  end
end
