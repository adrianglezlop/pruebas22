class State < ActiveRecord::Base
    has_many :credits
     require 'json'
    def self.loadJson(val)
        return if val.nil?
        puts "estado"
        elementos = JSON.parse(val)
        elementos.each do |elemento|
            self.create(clave:elemento["clave"].to_i,descripcion:elemento["descripcion"].strip!)
        end
    end
end
