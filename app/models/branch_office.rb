class BranchOffice < ActiveRecord::Base
    belongs_to :user
    belongs_to :product
    has_many :agents
    has_many :companies
    validates :nombre,
    :calle,
    :no_ext,
    #:colonia,
    :codigo_postal,
    :municipio,
    :estado,
    :banco,
    :cuenta,
    :telefono_oficina,
    :telefono_celular,
    :correo1,
    :comision_por_colocacion,
    :comision_por_cobranza,
    :monto_maximo_adeudo_sucursal,
    :formato_impresion,
    :user_id,
    :clave,
    presence:true
    
end
