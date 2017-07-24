class AddSplashimageOpacityToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :splashimage_opacity, :float
  end
end
