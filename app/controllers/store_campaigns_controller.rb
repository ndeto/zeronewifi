class StoreCampaignsController < ApplicationController
  
  def index
    @campaigns = StoreCampaign.where(store_id:current_store.id)
  end
   
  def new
    @campaign = StoreCampaign.new
  end

  def create
    @store = Store.find(current_store.id)
    @campaign = @store.store_campaign.create(campaign_params)
    @campaign = @campaign.save
    
    if @campaign
      flash[:notice] = "Campaign Created!"
      redirect_to(request.referer)
    else
      flash[:notice] = "Something went wrong!"
      redirect_to(request.referer)
  end
  end

  def edit
    @storecampaign = StoreCampaign.find(params[:id])
  end
  
  def update
    @storecampaign = StoreCampaign.find(params[:id])
    if @storecampaign.update(campaign_params)
      flash[:notice] = "Campaign Successfully updated!"
    else
      flash[:alert] = "Something went wrong, try again"
    end
    
    redirect_to(request.referer)
  end
  
  private
  
  
  
  def campaign_params
    params.require(:storecampaign).permit(:name, :campaign_id, :campaign_text_status, :campaign_text, :sponsored_text_status, :sponsored_text)
  end
  
  end
