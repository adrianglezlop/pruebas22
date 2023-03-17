class CodigoPostal < ActiveRecord::Base
  
    
    def self.loadData
        path = "https://api-codigos-postales.herokuapp.com/v2/codigo_postal/"
        #path = "https://sepomex-api.herokuapp.com/api/v1/zip_codes?zip_code/"
        (0...99999).each do |i|
           res HTTP.get(path + i.to_s).to_s
           current = self.where(cp:i)[0]
           if (current.nil?)
             self.create(cp:i, data: res) unless JSON.parse(res)['estado'] == ""
           else
             current.update(data: res) unless JSON.parse(res)['estado'] == ""
           end
           print res + "\n"
           print JSON.parse(res)['estado']
        end
    end


    def self.getData(val)
        row = self.where(cp:val).last
        if (row.nil?)
            return "{'codigo_postal':'0','municipio':'','estado':'','colonias':[]}"
        else
            return row.data
        end
    end



end

