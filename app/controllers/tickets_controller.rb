class TicketsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  before_action :set_ticket, only: [:show, :edit, :update, :destroy,:cancelar]

  # GET /tickets
  # GET /tickets.json
  def index
    
    @tickets = Ticket.all
    @tickets = @tickets.order(:updated_at)
    @tickets = @tickets.joins(:payment).where("payments.id = ?",params[:clave]) unless params[:clave]=="" or params[:clave].nil?
    
    @payment = Payment.find(params[:clave])
  end
  def multiprint
    require 'json'
    elementos = JSON.parse(params[:payments])
    @tickets = []
    elementos.each do |elemento|
      next if Payment.find(elemento["id"].to_i).estatus == 2
      pay = Payment.find(elemento["id"].to_i)
      ticket = Ticket.new(cantidad:pay.importe,payment_id:pay.id,status:1)
      if ticket.save
        @tickets  << ticket
        
      else 
        @tickets << pay.get_last_generated
      end
    end
    @tickets.length.times do |x|
      @tickets.length.times do |y|
        if @tickets[x].payment.credit.fecha_de_contrato < @tickets[y].payment.credit.fecha_de_contrato 
          aux = @tickets[y]
          @tickets[y] = @tickets[x]
          @tickets[x] = aux
        end
      end
    end
    pdf = ReciboPdf.new(@tickets)
    send_data pdf.render, filename: 'Recibo.pdf', type: 'application/pdf', disposition: "inline"
  end
  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @tickets = []
    @tickets << @ticket
     pdf = ReciboPdf.new(@tickets)
    send_data pdf.render, filename: 'Recibo.pdf', type: 'application/pdf', disposition: "inline"
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    flag = false 
    cant = ticket_params[:cantidad]
    pay = ticket_params[:payment_id]
    @ticket 
      
      if !(Payment.find(pay).tickets.count ==0)
          if Payment.find(pay).tickets.last.cantidad == Payment.find(pay).importe and Payment.find(pay).tickets.last.status==1 and  Payment.find(pay).importe == cant and Payment.find(pay).interes == 0 
            @ticket= Payment.find(pay).tickets.last
            Payment.find(pay).tickets.last.update(status:0)
            flag = true
          end
      end
      if flag == false
        t=Ticket.new(cantidad:cant,payment_id:pay,user_id:current_user.id)
        if t.save
          @ticket = t
        end
      end
      flag =  @ticket or flag
    respond_to do |format|
      if flag
        @ticket.payment.credit.terminado
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render :show}
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        @ticket.payment.credit.terminado
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /cancelar/1
  # PATCH/PUT /cancelar/1.json
  def cancelar
    respond_to do |format|
      if @ticket.update(status:3)
        
        @ticket.payment.update(estatus:0) unless @ticket.payment.pagado 
        @ticket.payment.update(estatus:1) if !@ticket.payment.pagado and  @ticket.payment.interes > 0
      
        format.html { redirect_to "/tickets?clave=#{@ticket.payment.id}", notice: 'Ticket was successfully updated.' }
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
      params.require(:ticket).permit(:cantidad, :payment_id, :status)
    end
end
