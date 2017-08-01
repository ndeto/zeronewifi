class PageController < ApplicationController
  def index
    #@sto = Store.where(key:params[:key])
    #@store = @sto[0]
    @store = Store.includes(:user).find_by(key: params[:key])
    @camp = StoreCampaign.find(@store.store_campaign_id)
    @user = User.find(@store.user_id)
    session[:store_id] = @store.id
    
    
    if @camp.splashpage_status == true
      redirect_to(pages_campaign_path)
    else
      render :layout=> false
    end
    
    
  end

  def campaign
    @store = Store.find(session[:store_id])
    @camp = StoreCampaign.find(@store.store_campaign_id)
    render :layout=> false
  end
  
  def submit
    @contact = Contact.create(contact_params.merge(store_id:session[:store_id],date:Date.current))
    if @contact.save
      flash[:notice] = "Success"
      redirect_to(root_path)
    else
      flash[:notice] = "NOpe"
      redirect_to(root_path)
    end
  end
  
  private
  
  def contact_params
    params.permit(:phone)
  end
end