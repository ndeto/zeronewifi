class AddStatusesToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :fb_status, :boolean
    #add_column :store_campaigns, :sms_status, :boolean
    add_column :store_campaigns, :email_status, :boolean
  end
end
