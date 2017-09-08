class AddStoreCampaignToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :store_campaign, foreign_key: true
  end
end
