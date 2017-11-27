class AddAttachmentVideoToStoreCampaigns < ActiveRecord::Migration
  def self.up
    change_table :store_campaigns do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :store_campaigns, :video
  end
end
