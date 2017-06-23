class PageController < ApplicationController
  def index
    #@sto = Store.where(key:params[:key])
    #@store = @sto[0]
    @store = Store.includes(:user).find_by(key: params[:key])
    @user = User.find(@store.user_id)
    session[:store_id] = @store.id
    render :layout => false

  end

  def campaign
    render :layout=> false
  end
end
