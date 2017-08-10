class StorePasswordsController < Devise::PasswordsController
  
   def new
    self.resource = resource_class.new
  end
end
