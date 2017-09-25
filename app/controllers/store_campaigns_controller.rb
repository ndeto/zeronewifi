class StoreCampaignsController < ApplicationController
  def index
    @campaigns = StoreCampaign.where(store_id:current_store.id)
    set_admin
  end

  def new
    @campaign = StoreCampaign.new
    set_admin
  end

  def create

    if params[:storecampaign][:campaign_id].to_i.equal?(3)
      splashpage_status = false
      campaign_text_status = true
      background = 'color'
      background_color = '#FFF'
      @store = Store.find(current_store.id)
      campaign_text = 'Welcome to ' + @store.store_name
      @campaign = @store.store_campaign.create(campaign_params.merge(splashpage_status:splashpage_status, campaign_text_status:campaign_text_status,campaign_text:campaign_text,background:background,background_color:background_color))
      @savecampaign = @campaign.save

      question = "Hello, please give us your opinion"
      @question = Question.create(question:question, store_campaign_id:@campaign.id,feedback:0)
      @question.save
    else
      splashpage_status = false
      campaign_text_status = true
      background = 'color'
      background_color = '#000'
      @store = Store.find(current_store.id)
      campaign_text = 'Welcome to ' + @store.store_name
      @campaign = @store.store_campaign.create(campaign_params.merge(splashpage_status:splashpage_status, campaign_text_status:campaign_text_status,campaign_text:campaign_text,background:background,background_color:background_color,contact_type_id:3))
      @savecampaign = @campaign.save

    end

    if @savecampaign
      flash[:notice] = "Campaign Created!"
      redirect_to(request.referer)
    else
      flash[:alert] = "Something went wrong!"
      redirect_to(request.referer)
    end
  end

  def edit
    @storecampaign = StoreCampaign.find(params[:id])
    set_admin
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

  def update_poll
    @storecampaign = StoreCampaign.find(params[:store_campaign_id])
    if @storecampaign.update(campaign_params)
      flash[:notice] = "Campaign Successfully updated!"

    else
      flash[:alert] = "Something went wrong, try again"
    end
    redirect_to(request.referer)
  end

  def test
    render layout:'admin'
  end

  def destroy
    @storecampaign = StoreCampaign.find(params[:id])
    if @storecampaign.destroy
      flash[:notice] = 'Campaign deleted'
      redirect_to(request.referer)
    else
      flash[:alert] = 'Something went wrong! Could not delete campaign'
      redirect_to(request.referer)
    end
  end

  private

  def campaign_params
    params.require(:storecampaign).permit(:name, :campaign_id, :campaign_text_status, :campaign_text, :sponsored_text_status, :sponsored_text, :media, :splashimage_opacity , :splashimage, :background_color ,
    :bg_img, :background, :splashpage_status, :video , :contact_type_id )
  end

end
