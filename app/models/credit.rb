class Credit < ActiveRecord::Base
    belongs_to :economical_activity
    belongs_to :customer
    belongs_to :product
    belongs_to :ocupation
    has_many :pdfs
    has_many :payments
    has_many :seguimientos
    belongs_to :destination
    belongs_to :profecion
    belongs_to :ocupation
    validates :referencia_agente_empresa,
    :fecha,
    :apellido_paterno,
    :apellido_materno,
    :nombre_1,
    :nombre_2,
    :RFC,
    :CURP,
    :INE,
    :nacionalidad,
    :fecha_de_nacimiento,
    :ciudad_de_nacimiento,
    :estado_de_nacimiento,
    :telefono_de_casa,
    :telefono_celular,
    :email_1,
    :escolaridad,
    :numero_de_dependientes_economicos,
    :gasto_promedio_mensual,
    :estado_civil,
    :calle,
    :numero_exterior,
    :tipo_de_domicilio,
    #:codigo_postal,
    #:colonia,
    #:municipio,
    :empresa_donde_labora,
    :giro_de_la_empresa,
    :telefono_empresa,
    :sueldo_mensual_neto,
    :dirreccion_empresa,
    :colonia_empresa,
    :municipio_empresa,
    :monto_solicitud,
    :cada_cuanto_se_realizara_el_pago,
    :lugar_donde_se_realizara_el_pago,
    :nombre_referencia_1,
    :domicilio_referencia_1,
    :antiguedad_laboral_anos,
    :antiguedad_laboral_meses,
    :nombre_referencia_2,
    :domicilio_referencia_2,
    :country,
    :nombre_referencia_familiar,
    :domicilio_referencia_familiar,
    :economical_activity_id,
    #:estado_actual,
    #:localidad,
    :product_id,
    :destination_id,
    :customer_id,
    :profecion_id,
    presence: true
    before_save :default_values
    after_save :pdf_trans
    def pdf_trans
        Pdf.migrate_from_credits
    end
    def default_values
      self.status ||= 0
    end
    validates :status, :inclusion => {:in => [nil,0,1,2,3]}
    # 0 por aceptar
    # 1 aceptado
    # 2 rechazada
    # 3 finalizada
    validates :sexo,
    :inclusion => { :in => [nil,1, 0] }
    validates :sexo,
    :presence => { :if => 'sexo.nil?' }

    validates :fiel,
    :inclusion => { :in => [nil,1, 0] }
    validates :fiel,
    :presence => { :if => 'fiel.nil?' }
    
    validates :vale,
    :inclusion => { :in => [nil,1, 0] }
    validates :vale,
    :presence => { :if => 'vale.nil?' }
    
    validates :es_cliente,
    :inclusion => { :in => [nil,1, 0] }
    validates :es_cliente,
    :presence => { :if => 'es_cliente.nil?' }
    
    validates :familiar_con_prestamo,
    :inclusion => { :in => [nil,1, 0] }
    validates :familiar_con_prestamo,
    :presence => { :if => 'familiar_con_prestamo.nil?' }
    validates_format_of :RFC, :with => /([A-Z][A-Z]|[A-Z])[A-Z][A-Z]\d\d\d\d\d\d(\w\w\w|)/
    #eee555555eee
     validates_format_of :CURP, :with => /[A-Z][A-Z][A-Z][A-Z]\d\d\d\d\d\d[A-Z][A-Z][A-Z][A-Z][A-Z][A-Z]\w\w/
     #BEML920313HCMLNS09.
     validates :referencia_agente_empresa, numericality: { other_than: 0 }
     validates :monto_solicitud, numericality: { less_than: 3001 }
     validates :agente_empresa,
    :inclusion => { :in => [nil,1, 0] }
    # 0 company 
    # 1 agent
    validates :agente_empresa,
    :presence => { :if => 'agente_empresa.nil?' }
    #   estado civil 
    # 0  ---  soltero   
    # 1 ----- casado
    # 2...... divorciado
    # 3-.-.-.-union libre
    # 4,-,--,-,viudo
    def estado_civil_cadena
        return case self.estado_civil
            when 0 
                "Soltero"
            when 1
                "Casado"
            when 2
                "Divorciado"
            when 3
                "Union libre"
            else
                "Viudo"
                
        end
                
    end
    def fecha_en_español
        fecha_aux = fecha_de_contrato
        cad ="#{fecha_aux.day} de "
        case fecha_aux.month  
        when 1
            cad = cad + "Enero"
        when 2
            cad = cad + "Febrero"
        when 3
            cad = cad + "Marzo"
        when 4
            cad = cad + "Abril"
        when 5
            cad = cad + "Mayo"
        when 6
            cad = cad + "Junio"
        when 7
            cad = cad + "Julio"
        when 8
            cad = cad + "agosto"
        when 9
            cad = cad + "Septiembre"
        when 10
            cad = cad + "Octubre"
        when 11
            cad = cad + "Noviembre"
        when 12
            cad = cad + "Diciembre"
        else
            cad = cad + "mes invalido"
        end
        cad = cad + " del #{fecha_aux.year}"
    end
    
    def padre 
        if agente_empresa==1
          return  Agent.find(self.referencia_agente_empresa)
        else
          return  Company.find(self.referencia_agente_empresa)
        end
    end
    
    def nombre_producto
        xprod= (self.product_id)
       return  Product.find(xprod).nombre_del_producto
    end
    
    def tipo_padre
        if agente_empresa==1
            "Agente"
        elsif agente_empresa == 0
            "Empresa"
        end
    end 

    def ciudad_tribunal
       xsuc= (self.padre.branch_office_id)
       return  BranchOffice.find(xsuc).ciudad_tribunal
    end

    def taza_ord
       xsuc= (self.padre.branch_office_id)
       if xsuc==36
            return  45.to_f
       else
            return  self.product.taza_de_interes_ordinaria.to_f
        end
       
    end

    def cat_sin_iva
       xsuc= (self.padre.branch_office_id)
       if xsuc==36
            return  (327.2).to_f
       else
            return  self.product.cat_sin_iva.to_f
        end
       
    end
    # agente   === 1
    # empresa === 0
    def nombre_completo_deudor
        (self.customer.nil?)? "#{self.apellido_paterno} #{self.apellido_materno} #{self.nombre_1} #{self.nombre_2}" : "#{self.customer.apellido_paterno} #{self.customer.apellido_materno} #{self.customer.nombre_1} #{self.customer.nombre_2}" 
    end
    def domicilio
    cad = "#{self.customer.calle}, #{self.customer.numero_exterior}, "
    cad = cad + " #{self.customer.numero_interior} " unless self.customer.numero_interior.nil?
    cad =cad +"#{self.customer.colonia}, #{self.customer.codigo_postal}"
  end
  def getCorrida 
        total= self.monto_solicitud.to_f + self.monto_solicitud.to_f * (self.product.taza_de_interes_ordinaria/100)
        pago = total/self.product.numero_de_pagos_a_realizar
        capital = pago/(1 + (self.product.taza_de_interes_ordinaria / 100))
        interes = (capital * ( self.product.taza_de_interes_ordinaria / 100))/ (1+ ((self.product.taza_de_interes_ordinaria - self.product.cat_sin_iva)/ 100))
        iva = interes*(self.product.taza_de_interes_ordinaria - self.product.cat_sin_iva)/100
        fecha = self.fecha
        arreglo = []
        arreglo.push(["PERIODO", "FECHA DE PAGO", "SALDO INICIAL", "CAPITAL", "INTERES", "IVA DE INTERES", "PAGO TOTAL", "SALDO FINAL"])
        self.product.numero_de_pagos_a_realizar.times do |n|
            arreglo.push([ "#{n+1}","#{(n%2==1)? fecha=fecha+15.day : fecha=fecha.end_of_month}","$#{(total-((n)*pago)).round(2)}","$#{capital.round(2)}","$#{interes.round(2)}","$#{iva.round(2)}","$#{pago.round(2)}","$#{((total-((n)*pago))-pago).round(2)}"])
        end
    arreglo
    end
     def self.get_by_branch_office(datos,suc_id)
        cad = ""
        co = 0
        datos.each do |credit| 
            if credit.padre.branch_office.id==suc_id.id
              cad = cad + " OR " unless co==0
              cad = cad + "credits.id = #{credit.id}"
              co=co+1
            end
        end
        return  (cad == "")? [] : Credit.where(cad) 
    end
    def fecha_de_contrato_formato
        aux= nil
        aux = self.fecha_de_contrato.strftime("%d/%m/%Y") unless self.fecha_de_contrato.nil?
        return aux
    end
    def calificacion
        count = 0
        self.payments.each do |payment|
            next if payment.interes == 0
            count = count + payment.vencimientos unless payment.vencimientos.nil?
        end
        if (count == 0)
            "A"
        elsif (count == 1 or count ==2)
            "B"
        elsif (count ==3 or count ==4)
            "C"
        elsif (count ==5 or count ==6)
            "D"
        elsif (count ==7 or count >7)
            "E"
        end
    end
    def periodo
        a = []
        unless self.payments == []
            a << self.payments.select(:fecha_de_pago).order(:fecha_de_pago)[0].fecha_de_pago
            a << self.payments.select(:fecha_de_pago).order(:fecha_de_pago).last.fecha_de_pago
        end
        return a 
    end
    def capital_pagado
        #self.total_pagado - self.interes_pagado
        aux = 0
        Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = 0",self.id).each do |ticket|
            aux += ticket.pago_capital
        end
        return aux
    end
    def total_pagado
         Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = 0",self.id).sum(:cantidad)
    end
    def interes_pagado
        (self.capital_pagado*(self.product.taza_de_interes_ordinaria/100))
    end
    def total_vencido
        sum = 0
        payments = Payment.joins(:credit).where("credits.id  = ? and payments.estatus = 1", self.id)
        payments.each do |payment|
            sum = sum + payment.deuda_sin_interes
        end
        return sum 
    end
    def total_vencido_con_moratorio
        sum = 0
        payments = Payment.joins(:credit).where("credits.id  = ? and payments.estatus = 1", self.id)
        payments.each do |payment|
            sum = sum + payment.deuda_con_interes
        end
        return sum 
    end
    def capital_vencido
        self.total_vencido - self.interes_vencido
    end
    def interes_vencido
       self.total_vencido * (self.product.taza_de_interes_ordinaria/100)
    end
    def interes_moratorio
        self.total_vencido_con_moratorio - self.total_vencido
    end
    def saldo_actual 
        (self.monto_solicitud * (1+(self.product.taza_de_interes_ordinaria/100))) - self.total_pagado
    end
    def atrasado
        #pagos = self.payments.where("payments.fecha_de_pago = ?","31/08/2017".to_date)
        #deuda = pagos.sum(:importe) + pagos.sum(:interes)
        #tickets=pagos.joins(:tickets)
    end
    def pdf64
        pdf = self.pdfs.order(:created_at)
        if pdf.empty?
            return ""
        else
            return pdf.last.pdf64
        end
    end
    def terminado
        return true if(self.status == 3)
        return false if(self.payments.count == 0)
        self.payments.each do |p|
            unless (p.pagado)
                return false
            end
        end
        self.update(status:3)
        return true
    end
    def self.terminados
        creditos = []
        Credit.all.each do |credit|
            if(credit.terminado)
                creditos << credit
            end
        end
        return creditos
    end
    def self.terminadosRapido
        Credit.where(status:3)
    end
    
    def cancelar_todo
        self.update(status:2)
        return if self.payments.count == 0 
        self.payments.each do |pay|
            next if pay.tickets.count==0
            pay.tickets.delete_all
        end
        self.payments.delete_all
    end
    #def corriente
    #    count = 0
    #    payments = self.payments.order(:fecha_de_pago)
    #    num = payments.count
    #    payments.each do |payment|
    #       count += 1
    #       break unless payment.estatus == 2 
    #    end
    #    if (num == count)
    #        count2 =0 
    #        praducto = payments[count-1].credit.product
    #        fechas = producto.fechas_de_corte
    #        fechas.each do |f|
    #          count2 += 1
    #          break unless f.fecha_de_corte == payments[count-1].fecha_de_corte
    #        end
    #        fechas[count] > Time.now.to_date 
    #    else
    #        payments[count].fecha_de_corte > Time.now.to_date 
    #    end
    #end
    def corriente
        self.payments.where(estatus:1).count == 0    
    end
    def getAPagar()
        fecha_de_corte = self.product.ultimaFechaDeCorte.fecha_de_corte
        payments = self.payments.where("payments.fecha_de_corte <= ? ",fecha_de_corte)
        acu = 0
        payments.each do |pay|
            acu += pay.deuda_con_interes
        end
        return acu.to_f
    end
    def create_customer
       customer=Customer.find_by(CURP:self.CURP)
        if customer.nil?
          customer=Customer.create(self.as_json(:except => [:pdf64,:destination_id,:casa_color,:cancel_o_porton,:color_de_cancel,:caracteristicas_especiales,:antiguedad_laboral_meses,:antiguedad_laboral_anos,:product_id,:antiguedad_en_el_domicilio_anterior_anos,:antiguedad_en_el_domicilio_anterior_meses,:antiguedad_en_el_domicilio_actual_meses,:antiguedad_en_el_domicilio_actual,:antiguedad_en_el_domicilio_anterior,:antiguedad_en_el_domicilio_actual_anos,:fecha,:es_cliente,:monto_solicitud,:cada_cuanto_se_realizara_el_pago,:lugar_donde_se_realizara_el_pago,:customer_id,:numero_de_cheque,:fecha_de_contrato,:updated_at,:id]))
        else
          customer.update(self.as_json(:except => [:pdf64,:destination_id,:casa_color,:cancel_o_porton,:color_de_cancel,:caracteristicas_especiales,:antiguedad_laboral_meses,:antiguedad_laboral_anos,:product_id,:antiguedad_en_el_domicilio_anterior_anos,:antiguedad_en_el_domicilio_anterior_meses,:antiguedad_en_el_domicilio_actual_meses,:antiguedad_en_el_domicilio_actual,:antiguedad_en_el_domicilio_anterior,:antiguedad_en_el_domicilio_actual_anos,:fecha,:es_cliente,:monto_solicitud,:cada_cuanto_se_realizara_el_pago,:lugar_donde_se_realizara_el_pago,:customer_id,:numero_de_cheque,:fecha_de_contrato,:updated_at,:id]))
        end
        self.customer_id=customer.id
        self.save()
    end
end
