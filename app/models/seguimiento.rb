class Seguimiento < ActiveRecord::Base
    belongs_to :payment
    
    def modif()
        #self.cobrado=locobrado
        #self.save()
        return "saludos"
    end
end
