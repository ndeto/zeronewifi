class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case resource
      when User then home_stores_path
      when Store then stores_path
    end
  end
  
  def after_update_path_for(resource)
    case resource
      when User then edit_user_registration_path
      when UserRegistration then edit_user_registration_path
      when Store then edit_store_registration_path
    end
  end

  
  def set_admin
    render layout:'admin'
  end
end
