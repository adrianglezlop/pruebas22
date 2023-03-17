class Pdf < ActiveRecord::Base
  belongs_to :credit
  def self.migrate_from_credits
      ids = Credit.select(:id).where.not("pdf64 = null and pdf64 = ''").as_json
      ids.each do |credit|
          sql = "Select pdf64 from credits where id = #{credit["id"]}"
          data = ActiveRecord::Base.connection.execute(sql)[0]["pdf64"]
          pdf = Pdf.new( pdf64:data, credit_id:credit["id"])
          
          
          if pdf.save()
              
              c=Credit.where(id:credit["id"])[0]
              c.update(pdf64:"")
              if c.pdfs.count>1
                c.pdfs.order(:created_at)[0].destroy
              end
          end
      end
  end
  
 
end
