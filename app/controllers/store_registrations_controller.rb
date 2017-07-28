class StoreRegistrationsController < Devise::RegistrationsController
  
  # GET /resource/sign_up
  def new
    build_resource({})
    yield resource if block_given?
    respond_with resource do |format|
      format.html { set_admin }
    end
end

  # POST /resource
  def create
    @user = User.find(current_user.id)
    @store = @user.store.create(store_params)

    if @store.save
      flash[:notice] = "DOne"
      redirect_to(root_path)
      else
      flash[:notice] = "Ooops"
    end
  end
 
  

  private

  def store_params
    params.require(:store).permit(:email, :username, :password, :password_confirmation)
  end

end
