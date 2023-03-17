class City < ActiveRecord::Base
    require 'json'
    def self.loadJson(val)
        puts "city"
        return if val.nil?
        elementos = JSON.parse(val)
        elementos.each do |elemento|
             ele = City.new(cve_estado: elemento["cve_estado"],
             dc_estado: elemento["dc_estado"],
             cve_localidad_inegi: elemento["cve_localidad_inegi"],
             dc_localidad_inegi: elemento["dc_localidad_inegi"],
             cve_municipio_siti_codigo_postal: elemento["cve_municipio_siti_codigo_postal"],
             dc_municipio_siti: elemento["dc_municipio_siti"],
             cve_colonia_siti_colonia: elemento["cve_colonia_siti_colonia"])
             
             if ele.save()
                puts "exitos: #{City.count}"
             else
                puts "errores: xxxxx"
             end
        end
    end
    
    def self.loadFile(path)
        return if path.nil?
        File.open(path).each_line do |line|
            elemento = JSON.parse(line)
            ele = City.new(cve_estado: elemento["cve_estado"].to_i,
             dc_estado: elemento["dc_estado"],
             cve_localidad_inegi: elemento["cve_localidad_inegi"].to_i,
             dc_localidad_inegi: elemento["dc_localidad_inegi"],
             cve_municipio_siti_codigo_postal: elemento["cve_municipio_siti_codigo_postal"].to_i,
             dc_municipio_siti: elemento["dc_municipio_siti"],
             cve_colonia_siti_colonia: elemento["cve_colonia_siti_colonia"].to_i)
             
             if ele.save()
                puts "exitos: #{City.count}"
             else
                puts "errores: #{elemento["cve_colonia_siti_colonia"]}"
             end
        end
    end
end
