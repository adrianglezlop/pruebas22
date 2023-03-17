class Receipt < ActiveRecord::Base
    belongs_to :payment
    
    before_create do
    self.folio = self.maximum('follio') + 1
        if Receipt.count==0
            self.folio=0
        end
        
    end
    
end
