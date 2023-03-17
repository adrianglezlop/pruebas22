class Conf < ActiveRecord::Base
    validates :RFC , presence:true
    validates_format_of :RFC, :with => /([A-Z][A-Z]|[A-Z])[A-Z][A-Z]\d\d\d\d\d\d\w\w\w/
    #eee555555eee
    before_validation(on: [:update,:create]) do
       self.RFC.upcase! 
    end
end
