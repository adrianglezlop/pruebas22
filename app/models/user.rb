class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :branchOffices
  has_many :tickets
   attr_accessor :login
    def login=(login)
    @login = login
  end

  def login
    @login || self.alias || self.email
  end
  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(alias) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:alias) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
    
  validates :alias, uniqueness: true
  validates :sexo,
    :inclusion => { :in => [true, false] }
  validates :sexo,
    :presence => { :if => 'sexo.nil?' }
  validates :tipo,:app,:apm,:nom1,:nom2,:RFC,:CURP,:seguro,:INE,:nacionalidad,:fecha_nacimiento,:nac_ciudad,:nac_estado,
            :nac_pais,:telefono_casa,:telefono_celular,:correo1,:calle,:numero_ext,
          :codigo_postal,:municipio,:estado,:pais,:alias,presence: true
  validates :tipo,
    :inclusion => { :in => [1,2,3,4] }
     validates_format_of :RFC, :with => /([A-Z][A-Z]|[A-Z])[A-Z][A-Z]\d\d\d\d\d\d(\w\w\w|)/
    #eee555555eee
     validates_format_of :CURP, :with => /[A-Z][A-Z][A-Z][A-Z]\d\d\d\d\d\d\w\w\w\w\w\w\d\d/
  def RFC=(val)
    write_attribute :RFC, val.upcase
  end
end
