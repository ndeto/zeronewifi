class PageController < ApplicationController
  def index
    #@sto = Store.where(key:params[:key])
    #@store = @sto[0]
   
    @store = Store.includes(:user).where(key: params[:key]).first

    @camp = StoreCampaign.find(@store.store_campaign_id)
    
    @user = User.find(@store.user_id)
    session[:store_id] = @store.id
    
    
    if @camp.splashpage_status == false
      redirect_to(pages_campaign_path)
    else
      render :layout=> false
    end
    
    rescue NoMethodError
    render 'lost' and return
    
    rescue ActiveRecord::RecordNotFound
    render 'lost' and return
    
  end

  def campaign
    @store = Store.find(session[:store_id])
    @camp = StoreCampaign.find(@store.store_campaign_id)
    render :layout=> false
  end
  
  def submit
    @contact = Contact.create(contact_params.merge(store_id:session[:store_id],date:Date.current))
    @contact.save
      redirect_to("http://login.after40.com/login?username=admin&password=root")
      #redirect_to("https://www.google.co.ke")
  end
  
  private
  
  def contact_params
    params.permit(:phone)
  end
end
