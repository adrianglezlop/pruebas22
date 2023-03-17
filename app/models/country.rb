class Country < ActiveRecord::Base
    has_many :credits
     require 'json'
    def self.loadJson(val)
        puts "pais"
        return if val.nil?
        elementos = JSON.parse(val)
        elementos.each do |elemento|
             self.create(clave:elemento["clave"].to_i,descripcion:elemento["pais"].strip!)
        end
    end
end
 