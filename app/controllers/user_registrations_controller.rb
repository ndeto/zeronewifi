class UserRegistrationsController < Devise::RegistrationsController
    # GET /resource/sign_up
  def new
    build_resource({})
    yield resource if block_given?
    respond_with resource do |format|
      format.html { set_admin }
    end

  end
end
