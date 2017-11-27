class AddBgImgToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :bg_img, :string
  end
end
