class AddActiveCampaignToStore < ActiveRecord::Migration[5.0]
  def change
    add_reference :stores, :store_campaign, foreign_key: true
  end
end
