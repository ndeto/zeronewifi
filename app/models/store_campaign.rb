class StoreCampaign < ApplicationRecord
  belongs_to :campaign
  belongs_to :store
end
