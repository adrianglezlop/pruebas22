class Ocupation < ActiveRecord::Base
    has_many:credits
    has_many:customers
    
    require 'json'
    def self.loadJson(val)
        puts "ocupacion"
        return if val.nil?
        elementos = JSON.parse(val)
        elementos.each do |elemento|
            self.create(clave:elemento["clave"].to_i,descripcion:elemento["descripcion"])
        end
    end
end
