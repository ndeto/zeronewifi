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
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        UserNotifier.send_signup_email(@user).deliver
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
  
  def edit
    set_admin
  end


  private
  

  
end
