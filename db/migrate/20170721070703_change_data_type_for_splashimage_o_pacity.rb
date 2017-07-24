class ChangeDataTypeForSplashimageOPacity < ActiveRecord::Migration[5.0]
  def change
    change_column(:store_campaigns, :splashimage_opacity, :decimal(10,1))
  end
end
