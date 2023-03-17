class EconomicalActivity < ActiveRecord::Base
    has_many :credits 
    def self.loadJson(val)
        puts "actividad"
        return if val.nil?
        elementos = JSON.parse(val)
        elementos.each do |elemento|
            self.create(clave:elemento["clave"].to_i,descripcion:elemento["descripcion"])
        end
    end
end
