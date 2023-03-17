class Expire < ActiveRecord::Base
      validates_uniqueness_of :created_at
      #validates_uniqueness_of :control
#      after_validation :vencer, on: [ :create ]
# 
#  private
#    def vencer
#        Coman.create(c:"solo una vez2  #{Time.now} expire: #{self.control}")
#    end
end
