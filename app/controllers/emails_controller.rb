class EmailsController < ApplicationController
  def create
    @store = Store.find(session[:store_id])
    @email = Contact.create(email_params.merge(store_id:@store.id,date:Time.now.strftime("%Y-%m-%d")))
    if @email.save
      redirect_to("http://#{@store.network_ip}/login?username=57EDBGH3&password=57EDBGH3")
    else
      flash[:alert] = "Sorry something went wrong, Try another login method"
      redirect_to(request.referer);
    end
  end

  private

  def email_params
    params.require(:email).permit(:email)
  end
end
