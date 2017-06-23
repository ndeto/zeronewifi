class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    render 'home'
  end

  def stores
    @stores = Store.where(user_id:current_user.id) rescue nil
  end
end
