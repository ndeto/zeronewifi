class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_store!, except:[:new,:create]
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    set_admin
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    set_admin
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    set_admin
  end

  # GET /tickets/1/edit
  def edit
    set_admin
  end

  # POST /tickets
  # POST /tickets.json
  def create
    num = params[:number_of_use].to_i
    @store = Store.find(1)
    @code = randy
    Ticket.create(code:@code,number_of_use:num)
  end

  def verify
    ticket = params[:ticket]

    @ticket = Ticket.where(code:ticket).first

    if @ticket.nil?
      flash[:alert] = "Invalid Ticket! Please request a ticket from a staff member"
      redirect_to(request.referer)
    else
      nu = @ticket.number_of_use - 1
      @ticket.update(number_of_use:nu)
      redirect_to("http://192.168.7.1/login?username=57EDBGH3&password=57EDBGH3")
    end
  end


  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:code)
    end

  def randy
    ref = [*'A'..'Z', *"0".."9"].sample(3).join
  end
end
