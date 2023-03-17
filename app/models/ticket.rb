class Ticket < ActiveRecord::Base
  belongs_to :payment
  belongs_to :user
   after_initialize :defaults
    validates :cantidad, :payment_id ,  presence:true
    def defaults
      self.status  ||= 0
    end
    before_validation(on: :create) do
        if (self.payment.tickets.where(status:1).count > 0 and self.status == 1) or self.payment.pagado
            false
        end
    end
     after_validation(on: :create) do
       # self.payment.update(status:2) if 
        Coman.create(c:"se ejecuto #{self.payment.deuda_sin_interes}   #{self.cantidad}")
        true
    end
    def pago_capital
        self.cantidad/(1 + (self.payment.credit.product.taza_de_interes_ordinaria / 100))
    end
    def pago_interes_con_iva
        self.pago_interes_sin_iva + self.pago_iva
    end
    def pago_interes_sin_iva
        (self.pago_capital * ((self.payment.credit.product.taza_de_interes_ordinaria / 100) / 1.16))
    end
    def pago_iva
        self.cantidad - self.pago_capital - self.pago_interes_sin_iva 
    end
end


#status
# 0 ------ aplicable
# 1 ------ generado por recibo (no aplicable)
# 3 ------ rechazado

=begin
flag = false
        if !(self.payment.tickets.count ==0)
            if self.payment.tickets.last.cantidad == self.payment.importe and self.payment.tickets.last.status==1 and  self.payment.importe== self.cantidad
                Ticket.transaction do
                    self.payment.tickets.last.update(status:0)
                end
                puts self.cantidad
                flag = true
            end
        end
=end        