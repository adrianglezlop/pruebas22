class Payout < ActiveRecord::Base
    validates :nombre,
    :days,
    :periocidad, 
    :scope_data,
    presence:true
    
    has_many :products
    def getDays
        self.days.split(',')
    end
    def getFlow 
        self.flow.split(',')
    end
    def self.array_to_text(val)
        return "" if val.nil?
        if (val.include?("-1"))
            val.delete("-1")
            val=val.join(", ")+" y ultimo del mes"
        else
            dat = val.delete(val.last)
            val=val.join(", ").to_s + " y #{dat}"  
        end
        return val
    end
    def inferior(val,array)
      array.sort!
      array.reverse!
      array.each do |n|                                                                                                                                                                                                                   
        return n.to_i if val.to_i > n.to_i
      end
      return val.to_i
   end
    #flow = 0 semanal 
    #flow = 1 mensual 
    #flow = 2 anual 
    
end
