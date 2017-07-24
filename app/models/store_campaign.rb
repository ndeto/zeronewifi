class StoreCampaign < ApplicationRecord
  belongs_to :campaign
  belongs_to :store
  
  mount_uploader :media, MediaUploader
  mount_uploader :splashimage, SplashimageUploader
  mount_uploader :bg_img, BgImgUploader
  
end
