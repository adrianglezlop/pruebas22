class CMunicipality < ActiveRecord::Base
  belongs_to :c_state
  has_many :c_locations
end
