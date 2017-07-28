class UserRegistrationsController < Devise::RegistrationsController
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
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = "User Created Successfully"
      redirect_to(users_stores_path)
    else
      flash[:notice] = "Something Went wrong, Try again"
    end
  end
  
  private
  
   def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
end
