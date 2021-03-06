class StoreCampaign < ApplicationRecord
  belongs_to :campaign
  belongs_to :store
  has_one :question, :dependent => :destroy
  
  mount_uploader :media, MediaUploader
  mount_uploader :splashimage, SplashimageUploader
  mount_uploader :bg_img, BgImgUploader
  
   has_attached_file :video, styles: {
    :medium => {
      :geometry => "640x480",
      :format => 'mp4'
    },
    #:thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
    :thumb => ["400x400#", :jpg,:time => 10]
  }, :processors => [:transcoder]
   validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/ 
  
end
#has_attached_file :media,
 #                 :styles => {:thumb => ["400x400#", :jpg]}