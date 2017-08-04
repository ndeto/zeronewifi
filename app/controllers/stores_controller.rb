class StoresController < ApplicationController
  
  before_action :authenticate_store!

  # GET /stores
  # GET /stores.json
  def index
    @store = Store.find(current_store.id)
    #@contacts = Contact.where(store_id:current_store.id)
    @contact = Contact.where(store_id:current_store.id).distinct.pluck(:date)
    set_admin
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
    @storecampaign = StoreCampaign.find(params[:id])
  end


  def settings
    @store = Store.find(current_store.id)
    set_admin
  end
  
  def update
    @store = Store.find(current_store.id)
    
    if @store.update(store_params)
      flash[:notice] = "Store has been Updated"
      redirect_to(stores_settings_path)
    else
      flash[:alert] = "Something went Wrong"
      redirect_to(stores_settings_path)
    end
  end
  
  private
  
  def store_params
    params.require(:store).permit(:store_name)
  end
  
end
  

