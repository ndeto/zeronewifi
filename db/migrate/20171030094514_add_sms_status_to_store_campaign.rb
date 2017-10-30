class AddSmsStatusToStoreCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :store_campaigns, :sms_status, :boolean, :default => false
  end
end
