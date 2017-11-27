class AddSplashImageToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :splashimage, :string
  end
end
