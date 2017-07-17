class HomeController < ApplicationController
  before_action :authenticate_store!

  def index
    render 'home'
  end

  def stores
    @stores = Product.where(store_id:current_user.id) rescue nil
  end
  
  def campaigns
    @campaigns = StoreCampaign.where(store_id:current_store.id)
  end
end
