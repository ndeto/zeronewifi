class AddStoreToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_reference :store_campaigns, :store, foreign_key: true
  end
end
