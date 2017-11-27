class PageController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #@sto = Store.where(key:params[:key])
    #@store = @sto[0]

    @store = Store.includes(:user).where(key: params[:key]).first

    @camp = StoreCampaign.find(@store.store_campaign_id)

    @user = User.find(@store.user_id)
    session[:store_id] = @store.id


    if @camp.splashpage_status == false
      redirect_to(pages_campaign_path)
    else
      render :layout => false
    end

  rescue NoMethodError
    render 'lost' and return

  rescue ActiveRecord::RecordNotFound
    render 'lost' and return

  end

  def campaign
    @store = Store.find(session[:store_id])
    @camp = StoreCampaign.find(@store.store_campaign_id)
    render :layout => false
  end

  def submit
    @store = Store.find(session[:store_id])
    @camp = StoreCampaign.find(@store.store_campaign_id)

    if @camp.sms_status
      redirect_to(pages_phone_path)
    else
      redirect_to(pages_code_path)
    end

  end

  def code
    @store = Store.find(session[:store_id])
    @camp = StoreCampaign.find(@store.store_campaign_id)
    render :layout => false
  end

  def phone
    @store = Store.find(session[:store_id])
    @camp = StoreCampaign.find(@store.store_campaign_id)
    render :layout => false
  end

  def ticket
    @store = Store.find(session[:store_id])
    @camp = StoreCampaign.find(@store.store_campaign_id)

    @contact = Contact.where(phone: params[:ticket][:phone]).order('created_at desc').first
    @date = Time.now.strftime("%m/%d/%Y")

    if @contact.nil?
      @code = randy
      @today = false
      # Include the helper gateway class
      require 'AfricasTalkingGateway'

      # Specify your login credentials
      if Rails.env.development?
        username = "cnetwifi";
        apikey = "da3fe299dc936e23363959d47738548d597bab7f23f2e8f596352b83eb1742d4";
      else
        username = "sandbox";
        apikey = "975c3c12bb8d96457d74b88085350fb5f4732d7c88d6c2dbf27640be9363d8b9";
      end
      # Specify the numbers that you want to send to in a comma-separated list
      # Please ensure you include the country code (+254 for Kenya in this case, +256 for Uganda)
      to = "#{params[:ticket][:phone]}"

      # And of course we want our recipients to know what we really do
      message = "Hello, welcome to After40 Hotel, your access code is #{@code}"

      # Create a new instance of our awesome gateway class
      gateway = AfricasTalkingGateway.new(username, apikey)

      # Any gateway error will be captured by our custom Exception class below,
      # so wrap the call in a try-catch block
      begin
        # Thats it, hit send and we'll take care of the rest.
        reports = gateway.sendMessage(to, message)

        if reports
          Ticket.create(code: @code, number_of_use: 2)
          Contact.create(store_id: @store.id, phone: params[:ticket][:phone], date: @date)
        end

        reports.each {|x|
          # status is either "Success" or "error message"
          puts 'number=' + x.number + ';status=' + x.status + ';messageId=' + x.messageId + ';cost=' + x.cost
        }
      rescue AfricasTalkingGatewayException => ex
        puts 'Encountered an error: ' + ex.message
      end
# DONE!
    else
      @date2 = @contact.created_at.strftime("%m/%d/%Y")
      puts @date
      puts @date2

      if @date == @date2
        puts "Date is equal to today"
        @today = true
      else
        @code = randy
        puts "Date is not equal to today"
        # Include the helper gateway class
        require 'AfricasTalkingGateway'

        # Specify your login credentials

        if Rails.env.development?
          username = "cnetwifi";
          apikey = "da3fe299dc936e23363959d47738548d597bab7f23f2e8f596352b83eb1742d4";
        else
          username = "sandbox";
          apikey = "975c3c12bb8d96457d74b88085350fb5f4732d7c88d6c2dbf27640be9363d8b9";
        end

        # Specify the numbers that you want to send to in a comma-separated list
        # Please ensure you include the country code (+254 for Kenya in this case, +256 for Uganda)
        to = "#{params[:ticket][:phone]}";


        # And of course we want our recipients to know what we really do
        message = "Hello, welcome to After40 Hotel, your access code is #{@code}"

        # Create a new instance of our awesome gateway class
        gateway = AfricasTalkingGateway.new(username, apikey)

        # Any gateway error will be captured by our custom Exception class below,
        # so wrap the call in a try-catch block
        begin
          # Thats it, hit send and we'll take care of the rest.
          reports = gateway.sendMessage(to, message)

          if reports
            Ticket.create(code: @code, number_of_use: 2)
            Contact.create(store_id: @store.id, phone: params[:ticket][:phone], date: @date)
          end

          reports.each {|x|
            # status is either "Success" or "error message"
            puts 'number=' + x.number + ';status=' + x.status + ';messageId=' + x.messageId + ';cost=' + x.cost
          }
        rescue AfricasTalkingGatewayException => ex
          puts 'Encountered an error: ' + ex.message
        end

        # DONE!
        @today = false
      end
      puts @today
      render :layout => false
#redirect_to(pages_ticket_path)
    end
  end

  def fb
    @store = Store.find(session[:store_id])
    @camp = StoreCampaign.find(@store.store_campaign_id)
    render :layout => false
  end

  def email
    @store = Store.find(session[:store_id])
    @camp = StoreCampaign.find(@store.store_campaign_id)
    render :layout => false
  end

  def regmail

  end

  private

  def randy
    ref = [*'A'..'Z', *"0".."9"].sample(3).join
  end

  def contact_params
    params.permit(:phone)
  end
end
