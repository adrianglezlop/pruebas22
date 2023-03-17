class Profecion < ActiveRecord::Base
    has_many :customers
    has_many :credits
     require 'json'
    def self.loadJson(val)
        puts "profecion"
        return if val.nil?
        elementos = JSON.parse(val)
        elementos.each do |elemento|
            self.create(clave:elemento["clave"].to_i,descripcion:elemento["descripcion"])
        end
    end
end
