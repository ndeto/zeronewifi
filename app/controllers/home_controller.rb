class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    render 'home'
  end

  def stores
    @stores = Store.where(user_id:current_user.id) rescue nil
    set_admin
  end
  
  def campaigns
    @campaigns = StoreCampaign.where(store_id:current_store.id)
  end
end
