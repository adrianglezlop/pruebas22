class LocalidadCnbv < ActiveRecord::Base
    has_many :credits
     require 'json'
    def self.loadJson(val)
        puts "localidad"
        return if val.nil?
        elementos = JSON.parse(val)
        elementos.each do |elemento|
            self.create(clave:elemento["clave"].to_i,descripcion:elemento["descripcion"].strip!,entidad_federativa:elemento["entidad_federativa"].strip!)
        end
    end
end
