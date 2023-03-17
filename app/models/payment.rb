class Payment < ActiveRecord::Base
    belongs_to :credit
    has_many :receipts
    has_many :tickets
    has_many :seguimiento

    before_save :iniciar_vencimientos
    def pagado
        if self.total_pagado.to_f >= self.importe.to_f
             self.update(:estatus => 2)
             return true
         else
            return false
        end
    end
    def deuda_sin_interes
        self.importe - self.total_pagado
    end
    def deuda_con_interes
        val = self.importe - self.total_pagado 
        val = val + self.interes unless self.interes_flag == true 
        return val
    end 
    def total_pagado
        Ticket.where(payment_id:self.id).where(status:0).sum(:cantidad)
    end
    def activo
        self.credit.payments.order(:fecha_de_pago).each do |tk|
            puts tk.id
            unless tk.pagado
                if tk.id == self.id
                    return true
                else
                    return false
                end
            end
        end
    end
    def cargar_interes
        unless self.estatus==2
            inter =  self.deuda_sin_interes * (self.credit.product.interes_moratorio_aplicable.to_f/100)
            self.update(interes: inter + self.interes,estatus:1,vencimientos:self.vencimientos.to_i+1)
        end
        
    end
    def get_last_generated
        return self.tickets.where(status:1).last
    end
    def iniciar_vencimientos
      self.interes_flag  ||= false
      self.vencimientos  ||= 0
    end
    def pago_empresa_ready
        self.tickets.count==1 && self.tickets[0].status==1 && self.estatus == 0 && self.credit.corriente
    end
    def fecha_updated_last_ticket
        ticket = self.tickets.where(status:0).last
        return Auxiliar.fecha_formato(ticket.updated_at) unless ticket.nil?
        return ""
    end
    # 0 ------ al corriente
    # 1 ------ Vencido
    # 2 ------ pagado


end
