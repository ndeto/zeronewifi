class StoreRegistrationsController < Devise::RegistrationsController
  
  
  
  # GET /resource/sign_up
  def new
    if !user_signed_in?
      redirect_to(new_user_session_path) and return
    end
    if store_signed_in?
      flash[:alert] = "You need to logout of the current store to register another store"
    end
    build_resource({})
    yield resource if block_given?
    respond_with resource do |format|
      format.html { set_admin }
    end
end

  # POST /resource
  def create
    key = ref = [*'A'..'Z', *"0".."9"].sample(8).join
    @user = User.find(current_user.id)

    ticket = params[:store][:store_name]
    @tick = Store.where(store_name:ticket).first

    if !@tick.nil?
      flash[:alert] = "Choose a different store name, That one is already taken"
      redirect_to(request.referer) and return
    end
    @store = @user.store.create(store_params.merge(key:key,active:false,ticket_key:santize(ticket)))
    if @store.save
      flash[:notice] = "Your store has been created! Login to create your campaigns"
      redirect_to(home_stores_path)
    else
      flash[:alert] = "Sorry, Something went wrong"
      redirect_to(request.referer) and return
    end

  end
  
  def edit
    set_admin
  end
 
  

  private

  def store_params
    params.require(:store).permit(:email, :username, :password, :password_confirmation, :store_name, :ticket_key)
  end

  def santize(name)
    lower = name.downcase
    nospace = lower.gsub(/[^0-9a-z]/i, "")
    return nospace
  end

end
