class PageController < ApplicationController
  def index
    #@sto = Store.where(key:params[:key])
    #@store = @sto[0]
    @store = Store.includes(:user).find_by(key: params[:key])
    @user = User.find(@store.user_id)
    session[:store_id] = @store.id
    render :layout => false

  end

  def campaign
    render :layout=> false
  end
  
  def submit
    @contact = Contact.create(contact_params.merge(store_id:session[:store_id]))
    if @contact.save
      flash[:notice] = "Success"
      redirect_to(root_path)
    else
      flash[:notice] = "NOpe"
      redirect_to(root_path)
    end
  end
  
  private
  
  def contact_params
    params.permit(:phone)
  end
end
