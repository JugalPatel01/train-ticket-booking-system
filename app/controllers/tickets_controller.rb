class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ] 

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end
  
  def passenger_log
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    
    @s_id = params[:data].to_i
    @sobject = Schedule.find(@s_id)
    @t_id = @sobject.train_id
    @t_fair = @sobject.tour_fare
    @fortrain = Train.find(@t_id)
    @forschedule = Schedule.find(@s_id)
    @startplace = Place.find(@forschedule.src_place_id)
    @endplace = Place.find(@forschedule.dst_place_id) 
    
    @ticket = current_user.tickets.build
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    # @ticket = Ticket.new(ticket_params)
    @ticket = current_user.tickets.build(ticket_params)
    @count = Schedule.find(ticket_params[:schedule_id])
    @fortrain = Train.find(ticket_params[:train_id])
    @count.pass_count = @count.pass_count + ticket_params[:no_of_people].to_i
    @count.save
    
    respond_to do |format|
      if @ticket.save and @count.pass_count <= @fortrain.train_capacity
        format.html { redirect_to root_url, notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        @count.pass_count = @count.pass_count - ticket_params[:no_of_people].to_i
        @count.save
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @count = Schedule.find(@ticket.schedule_id)
    @fortrain = Train.find(@ticket.train_id)
    @count.pass_count = @count.pass_count - @ticket.no_of_people
    @count.save
    
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

   

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:no_of_people, :total_amount, :user_id,:train_id,:schedule_id,:payment_id,:data)
    end
end
