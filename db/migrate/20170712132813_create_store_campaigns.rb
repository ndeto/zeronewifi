class CreateStoreCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :store_campaigns do |t|
      t.references :campaign, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
