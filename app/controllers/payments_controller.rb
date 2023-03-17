class PaymentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :update
  before_action :set_payment, only: [:update]
 def index
    require 'json'
    #suc = params[:sucursal]
    padres = params[:padres]
    padres = JSON.parse params[:padres] unless  params[:padres].nil? or params[:padres]==""
    fecha = params[:fecha].to_date unless params[:fecha].nil? 
    prod = params[:producto].to_i
    @credits = Credit.all.where(status:1).select(:fecha_de_contrato,:id,:fecha,:apellido_paterno,:apellido_materno,:nombre_1,:nombre_2,:RFC,:fecha_de_contrato,:monto_solicitud,:agente_empresa,:referencia_agente_empresa)
    @payments=  Payment.joins(:credit).where("credits.status = ? ",1)
    @payments = @payments.where(fecha_de_impresion:fecha) unless params[:fecha].nil? or params[:fecha] == ""
    @payments = @payments.where("credits.product_id = ? ",prod) unless params[:producto].nil? or params[:producto] == ""
    cad = ""
    i =0
    unless padres.nil?
      padres.each do |padre|
        cad = cad + " OR " unless i==0
        cad = cad + "credits.referencia_agente_empresa = #{padre["padre"].to_i} and  credits.agente_empresa = #{padre["tipo"].to_i}"  unless  params[:padres].nil? or params[:padres]==""
        i=i+1
      end
    end
    @payments = @payments.where(cad) unless  cad==""
    @payments = @payments.order(:created_at)
    unless  params[:nextval].nil? or params[:nextval]==""
      @payments = @payments.reject{|payment| payment.pago_empresa_ready==false}
    end
    
     
  end
  def dates
  end
  def vencer 
    pa=Payment.find(params[:id])
    pa.cargar_interes
    redirect_to "/payments/show?clave=#{pa.credit.id}"
  end
  def pagar
   payment = Payment.find(params[:id])
   payment.tickets[0].update(status:0)
   redirect_to payment.tickets[0]
  end
  
  def to_bool(s)
    return true if s =~ (/^(true|t|yes|y|1)$/i)
    return false if s.empty? || s =~ (/^(false|f|no|n|0)$/i)
    raise ArgumentError.new "invalid value: #{s}"
  end
  
  def update
    Coman.create(c:"cacallll #{params[:interes_flag]} #{@payment}")
    @payment.update(interes_flag:to_bool(params[:interes_flag].to_s))

  end
  def show
    @credit = Credit.find(params[:clave]) unless params[:clave].nil? || params[:clave]==""
  end
  def paymentscompany
  end
  def set_payment
    @payment = Payment.find(params[:id])
  end
  def payment_params
    params.require(:payment).permit(:interes_flag)
  end
end
