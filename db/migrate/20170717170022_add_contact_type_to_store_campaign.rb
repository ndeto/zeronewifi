class AddContactTypeToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_reference :store_campaigns, :contact_type, foreign_key: true
  end
end
