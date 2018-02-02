class StoresController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:email]
  before_action :authenticate_store!

  # GET /stores
  # GET /stores.json
  def index
    @store = Store.find(current_store.id)
    #@contacts = Contact.where(store_id:current_store.id)
    @contact = Contact.where(store_id: current_store.id).where('created_at >= ?', 1.week.ago).distinct.pluck(:date)
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

    ticket = params[:store][:ticket_key]
    @tick = Store.where(ticket_key: ticket).first

    if !@tick.nil? && @tick.id != current_store.id
      flash[:alert] = "This key isn't allowed, try another one"
      redirect_to(request.referer) and return
    end

    if @store.update(store_params)
      flash[:notice] = "Store has been Updated"
      redirect_to(stores_settings_path)
    else
      flash[:alert] = "Something went Wrong"
      redirect_to(stores_settings_path)
    end
  end

  def activate
    @store = Store.find(current_store)
    @store.update(store_campaign_id: params[:id])
    redirect_to(request.referer)
  end

  def clients
    @contacts = Contact.where(store_id: current_store.id).where("contacts.phone IS NOT NULL").distinct.pluck(:phone)
    @emails = Contact.where(store_id: current_store.id).where("contacts.email IS NOT NULL").distinct.pluck(:email)
    set_admin
  end

  def phone
    @num = params[:contact]
    @client = Contact.where(store_id: current_store.id, phone: params[:contact]).distinct.pluck(:date)
#    @contact = Contact.where('created_at >= ?',1.week.ago).where(store_id:current_store.id).order("date ASC").distinct.pluck(:date)
    set_admin
  end

  def email
    @email = params[:contact]
    @client = Contact.where(store_id: current_store.id, email: params[:contact]).order("created_at ASC").distinct.pluck(:date)
    set_admin
  end

  def secret
    @store = Store.all
  end

  def destroy
    @store = Store.find(params[:id])

    if @store.destroy
      flash[:notice] = "Store Successfully deleted"
      redirect_to(request.referer)
    else
      flash[:alert] = "Store couldnt be deleted"
      redirect_to(request.referer)
    end

  end

  def contacts
    @phones = Contact.where(store_id: current_store.id).where('contacts.phone IS NOT NULL')
    @emails = Contact.where(store_id: current_store.id).where('contacts.email IS NOT NULL')
    respond_to :xls
  end

  def data
    set_admin
  end

  def allres
    from = params[:from]
    to = params[:to]
    @phones = Contact.where('date >= ?', from).where('date <= ?', to).where('contacts.phone IS NOT NULL').where(store_id: current_store.id)
    @phonesdistinct = Contact.where('date >= ?', from).where('date <= ?', to).where('contacts.phone IS NOT NULL').where(store_id: current_store.id).distinct.pluck(:phone)
    @emails = Contact.where('date >= ?', from).where('date <= ?', to).where('contacts.email IS NOT NULL').where(store_id: current_store.id)
    @emailsdistinct = Contact.where('date >= ?', from).where('date <= ?', to).where('contacts.email IS NOT NULL').where(store_id: current_store.id).distinct.pluck(:email)
    render :layout => false
  end

  def allphones
    from = params[:from]
    to = params[:to]
    @contacts = Contact.where('date >= ?', from).where('date <= ?', to).where('contacts.phone IS NOT NULL').where(store_id: current_store.id).where(store_id: current_store.id)
    render :layout => false
  end

  def allemails
    from = params[:from]
    to = params[:to]
    @contacts = Contact.where('date >= ?', from).where('date <= ?', to).where('contacts.email IS NOT NULL').where(store_id: current_store.id)
    render :layout => false
  end

  def uniquephones
    from = params[:from]
    to = params[:to]
    @contacts = Contact.where('date >= ?', from).where('date <= ?', to).where('contacts.phone IS NOT NULL').where(store_id: current_store.id).distinct.pluck(:phone)
    render :layout => false
  end

  def uniqueemails
    from = params[:from]
    to = params[:to]
    @contacts = Contact.where('date >= ?', from).where('date <= ?', to).where('contacts.email IS NOT NULL').where(store_id: current_store.id).distinct.pluck(:email)
    render :layout => false
  end

  private

  def store_params
    params.require(:store).permit(:store_name, :username, :active, :network_ip, :ticket_key)
  end

end
  

