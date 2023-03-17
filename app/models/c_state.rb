class CState < ActiveRecord::Base
  belongs_to :c_country
  has_many :c_municipalities
end
