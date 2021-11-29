class ViewCreditsController < ApplicationController
   before_action :set_credit, only: [:autorizacion,:caratula,:caratulamun,:contratomunicipal,:contrato,:entrevista,:poliza,:polizamun,:corrida,:corridamun,:documentos, :getFecha]
  before_action :set_credits, only:[:show, :edit, :update, :destroy]
 
  def index
    @credits = Credit.all.where(status:0).select(:id,:vale,:product_id,:fecha,:apellido_paterno,:apellido_materno,:nombre_1,:nombre_2,:RFC,:fecha_de_contrato,:monto_solicitud,:agente_empresa,:referencia_agente_empresa,:created_at).order(:created_at)
    if current_user.tipo==3
      @credits= Credit.get_by_branch_office(@credits,current_user.branchOffices[0])
    end
  end
  def aceptadas
  end
  def rechazadas
    @credits = Credit.all.where(status:2).select(:id,:fecha,:apellido_paterno,:apellido_materno,:nombre_1,:nombre_2,:RFC,:fecha_de_contrato,:monto_solicitud,:agente_empresa,:referencia_agente_empresa)
    if current_user.tipo==3
       @credits= Credit.get_by_branch_office(@credits,current_user.branchOffices[0])
    end
  end
  # GET /credits/1
  # GET /credits/1.json
  def show
  end
  
  def documentos
    @link =  (params[:retorno] == "1") ? "/view_credits/aceptadas" : "/customers/#{@credit.customer_id}/historial"
  end
  def pagos
    @credit = Credit.find(params[:id])
    @payments = Payment.joins(:credit).where("credits.id = ?",@credit.id).order(:created_at)
  end
  def autorizacion
    pdf = AutorizacionPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
    #filename = "#{Rails.root}/app/pdf/autorizacion_en_blanco.pdf"
    #Prawn::Document.generate("full_template.pdf", :template => filename) do
    #  text "THis content is written on the first page of the template", :align => :center
    #end
  end
  def caratula
    pdf = CaratulaPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  
  def caratulamun
    pdf = CaratulamunPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  
  def contratomunicipal
    if (@credit.fecha_de_contrato.nil?)
      @credit.update(fecha_de_contrato:Time.now)
    end
    if @credit.payments.count==0
      getArreglomun()
      n = 0
      @datos.each do |d|
        n += 1
        payment_v = Payment.create(fecha_de_pago:d[1],recibo:"#{n}/#{@datos.count}",estatus:0,importe:d[8],credit:@credit, pago:0, interes:0,fecha_de_corte:d[9],fecha_de_impresion:d[10])
        payment_v.delay(run_at:d[8]).cargar_interes
      end
    end
    
    #pdf= Prawn:: Document.new(@credit)
    pdf = ContratoMunicipalPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  
  def contrato
    if (@credit.fecha_de_contrato.nil?)
      @credit.update(fecha_de_contrato:Time.now)
    end
    if @credit.payments.count==0
      getArreglo()
      n = 0
      @datos.each do |d|
        n += 1
        payment_v = Payment.create(fecha_de_pago:d[1],recibo:"#{n}/#{@datos.count}",estatus:0,importe:d[6],credit:@credit, pago:0, interes:0,fecha_de_corte:d[8],fecha_de_impresion:d[9])
        payment_v.delay(run_at:d[8]).cargar_interes
      end
    end
      
    pdf = ContratoPdf.new(@credit)
     
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  def entrevista
    pdf = EntrevistaPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  def poliza
    pdf = PolizaPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  
  def polizamun
    pdf = PolizamunPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  
  def corrida
    getArreglo()
    pdf = CorridaPdf.new(@credit,@arreglo)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  
  def corridamun
    getArreglomun()
    pdf = CorridamunPdf.new(@credit,@arreglomun)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  
  
   def inferior(val,array)
      array.sort!
      array.reverse!
      array.each do |n|                                                                                                                                                                                                                   
        return n.to_i if val.to_i > n.to_i
      end
      return val.to_i
   end
   
   
  def getArreglo
     if (@credit.fecha_de_contrato.nil?)
      fecha = Time.now.to_date
    else
      fecha = @credit.fecha_de_contrato.to_date
    end
    
    cantidad= @credit.product.payout.getDays.length
    fin_mes= @credit.product.payout.getDays.include? "-1"
    dias=  @credit.product.payout.getDays - ["-1"]
    cortes =  @credit.product.payout.getFlow.sort!
    dias_int =[]
    cortes_int = []
    dias.each do |i|
      dias_int.push(i.to_i)
    end
    dias_int.sort!
    dias.push("-1") if fin_mes
    dia_inicial = nil;
    cortes.each do |i |
      cortes_int.push(i.to_i)
    end
    cortes_int.sort!
      cont = 0
      dias.each do |dia|
         dia= fecha.end_of_month.day if dia=="-1"
         if fecha.day<dia.to_i
           if fecha.day <inferior(dia,cortes_int)
            dia_inicial=cont
            puts "dia #{dia}"
            break
           end
         end
         cont +=1
      end
        
        if dia_inicial==nil
          dia_inicial = 0
        end
        puts "dia inicial #{dia_inicial}"
        puts dias

    @total= @credit.monto_solicitud.to_f + (@credit.monto_solicitud.to_f * (@credit.taza_ord/100))
    @pago = @total/@credit.product.numero_de_pagos_a_realizar
    @capital = @pago/(1 + (@credit.taza_ord / 100))
    #@interes = (@capital * ( @credit.product.taza_de_interes_ordinaria / 100))/ (1+ ((@credit.product.taza_de_interes_ordinaria - @credit.product.cat_sin_iva)/ 100))
    @interes = (@capital * ((@credit.taza_ord / 100) / 1.16))
    #if @credit.product.comision_apert >0
      #@interes = (@capital * ((@credit.product.taza_de_interes_ordinaria / 100)))
      #@iva = @interes*(16/100)
    #else
      @interes = (@capital * ((@credit.taza_ord / 100) / 1.16))
      @iva = @interes*(@credit.taza_ord - 16)/100
    #end
    #@iva = @interes*(@credit.product.taza_de_interes_ordinaria - @credit.product.cat_sin_iva)/100
    
    #@com_apert = (@capital + @interes) * (@credit.product.comision_apert / 100) 
    @datos = []
    @arreglo = []
    @arreglo.push(["PERIODO", "FECHA DE PAGO", "SALDO INICIAL", "CAPITAL", "INTERES", "IVA DE INTERES","PAGO TOTAL", "SALDO FINAL"])
    puts "=========================================================================================================================================="
    @credit.product.numero_de_pagos_a_realizar.times do |n|
        
        aux= getFecha(dias,dia_inicial,n,fecha,cortes_int)
        fecha = aux["pago"]
        fecha_de_corte = aux["corte"]
        fecha_de_impresion = aux["impresion"]
     
      puts fecha
      puts fecha_de_corte
      puts fecha_de_impresion  
      #              1   2                         4       5          6      7           8                       9                 10            
      @datos.push([n+1,fecha,(@total-((n)*@pago)),@capital,@interes,@iva,@pago,((@total-((n)*@pago))-@pago),fecha_de_corte,fecha_de_impresion])
      #@datos.push([n+1,fecha,(@total-((n)*@pago)),@capital,@interes,@iva,@com_apert,@pago,((@total-((n)*@pago))-@pago),fecha_de_corte,fecha_de_impresion])
      @arreglo.push([ "#{n+1}",fecha.to_date.strftime("%d-%m-%Y"),"#{Dinero.to_money((@total-((n)*@pago)).round(2))}","#{Dinero.to_money(@capital.round(2))}","#{Dinero.to_money(@interes.round(2))}","#{Dinero.to_money(@iva.round(2))}","#{Dinero.to_money(@pago.round(2))}","#{Dinero.to_money(((@total-((n)*@pago))-@pago).round(2))}"])
      #@arreglo.push([ "#{n+1}",fecha.to_date.strftime("%d-%m-%Y"),"#{Dinero.to_money((@total-((n)*@pago)).round(2))}","#{Dinero.to_money(@capital.round(2))}","#{Dinero.to_money(@interes.round(2))}","#{Dinero.to_money(@iva.round(2))}","#{Dinero.to_money(@com_apert.round(2))}","#{Dinero.to_money(@pago.round(2))}","#{Dinero.to_money(((@total-((n)*@pago))-@pago).round(2))}"])
    end
    puts "=========================================================================================================================================="
  end
  
  
  def getArreglomun
     if (@credit.fecha_de_contrato.nil?)
      fecha = Time.now.to_date
    else
      fecha = @credit.fecha_de_contrato.to_date
    end
    cantidad= @credit.product.payout.getDays.length
    fin_mes= @credit.product.payout.getDays.include? "-1"
    dias=  @credit.product.payout.getDays - ["-1"]
    cortes =  @credit.product.payout.getFlow.sort!
    dias_int =[]
    cortes_int = []
    dias.each do |i|
      dias_int.push(i.to_i)
    end
    dias_int.sort!
    dias.push("-1") if fin_mes
    dia_inicial = nil;
    cortes.each do |i |
      cortes_int.push(i.to_i)
    end
    cortes_int.sort!
      cont = 0
      dias.each do |dia|
         dia= fecha.end_of_month.day if dia=="-1"
         if fecha.day<dia.to_i
           if fecha.day <inferior(dia,cortes_int)
            dia_inicial=cont
            puts "dia #{dia}"
            break
           end
         end
         cont +=1
      end
        
        if dia_inicial==nil
          dia_inicial = 0
        end
        puts "dia inicial #{dia_inicial}"
        puts dias
    #@total= @credit.monto_solicitud.to_f + (@credit.monto_solicitud.to_f * (@credit.product.taza_de_interes_ordinaria/100))
    @total= @credit.monto_solicitud.to_f 
    @pago = (@total/@credit.product.numero_de_pagos_a_realizar)
    @capital = @pago/(1 + (@credit.product.taza_de_interes_ordinaria / 100))
    #@interes = (@capital * ( @credit.product.taza_de_interes_ordinaria / 100))/ (1+ ((@credit.product.taza_de_interes_ordinaria - @credit.product.cat_sin_iva)/ 100))
    #@interes = (@capital * ((@credit.product.taza_de_interes_ordinaria / 100) / 1.16))
    #if @credit.product.comision_apert >0
      @interes = (@pago * ((@credit.product.taza_de_interes_ordinaria / 100)))
      @iva = @interes*(16/100)
    #else
    #  @interes = (pago * ((@credit.product.taza_de_interes_ordinaria / 100) / 1.16))
    #  @iva = @interes*(@credit.product.taza_de_interes_ordinaria - 16)/100
    #end
    #@iva = @interes*(@credit.product.taza_de_interes_ordinaria - @credit.product.cat_sin_iva)/100
  
    
    #@com_apert = (@capital + @interes) * (@credit.product.comision_apert / 100) 
    @datos = []
    @arreglomun = []
    #@arreglo.push(["PERIODO", "FECHA DE PAGO", "SALDO INICIAL", "CAPITAL", "INTERES", "IVA DE INTERES","PAGO TOTAL", "SALDO FINAL"])
    @arreglomun.push(["PERIODO", "FECHA","SALDO INICIAL",  "AMORTIZACIÓN", "INTERES", "IVA_INTERES","COM_APERT","SEGURO_VIDA","PAGO TOTAL"])
    puts "=========================================================================================================================================="
    
    xint=@pago * (@credit.product.taza_de_interes_ordinaria / 100)
     xiva=xint * 0.16
    
      @com_apert = (@pago + xint) * (@credit.product.comision_apert / 100) 
     
      xtotpago=@pago + xint + xiva + @com_apert
    
    totalcont=(@credit.product.numero_de_pagos_a_realizar) 
    totalcont.times   do |n|
        
        aux= getFecha(dias,dia_inicial,n,fecha,cortes_int)
        fecha = aux["pago"]
        fecha_de_corte = aux["corte"]
        fecha_de_impresion = aux["impresion"]
     
     
     
      puts fecha
      puts fecha_de_corte
      puts fecha_de_impresion  
       #        "PERIODO FECHA SALDO INICIAL    AMORTIZ  INT  IVA COM_APE  SEGURO   PAGO TOTAL       FECHA_CORTE   FECHA_IMP              
       #              0   1             2            3    4    5      6      7              8                 9        10    
      @datos.push([n+1,fecha,(@total-((n)*@pago)),@pago,xint,xiva,@com_apert,0,xtotpago,fecha_de_corte,fecha_de_impresion])
      @arreglomun.push([ "#{n+1}",fecha.to_date.strftime("%d-%m-%Y"),"#{Dinero.to_money((@total-((n)*@pago)).round(2))}","#{Dinero.to_money(@pago.round(2))}","#{Dinero.to_money(xint.round(2))}","#{Dinero.to_money(xiva.round(2))}","#{Dinero.to_money(@com_apert.round(2))}",0,"#{Dinero.to_money(xtotpago.round(2))}"])
    end
    puts "=========================================================================================================================================="
    
  end

  def getFecha(dias,inicio,contador,fecha,cortes)
    fechas = Hash.new
    contador = contador + inicio
    index =(contador)%dias.length
    avance = 0
    case @credit.product.payout.type_payout
    when 0
      avance = contador%dias.length==0?1.week : 0.week unless contador==0
      avance = 1.week if (@credit.fecha_de_contrato.to_date.wday.to_int-1) >= cortes.max && contador==0
      fechas["pago"] = fecha.beginning_of_week+(dias[index].to_i-1).day+avance
      fechas["corte"] = fechas["pago"].beginning_of_week+inferior(fechas["pago"].day,cortes).days-1.days
      fechas["impresion"] = fechas["corte"] - (@credit.product.payout.desplazamiento).to_i.days
      
    when 1
      avance = contador%dias.length==0?1.month : 0.month unless contador==0
      avance = 1.month if @credit.fecha_de_contrato.to_date.day.to_int >= cortes.max && contador==0
      fechas["pago"] = (dias[index].to_i==-1?fecha.end_of_month : fecha-fecha.day.day+dias[index].to_i.day)+avance
      fechas["corte"] = fechas["pago"].beginning_of_month+inferior(fechas["pago"].day,cortes).days-1.days
      fechas["impresion"] = fechas["corte"] - (@credit.product.payout.desplazamiento).to_i.days
    end
    return fechas
  end
 def set_credit
        @credit = Credit.find(params[:clave])
 end
 def set_credits
      @credit = Credit.find(params[:id])
 end
 
end
