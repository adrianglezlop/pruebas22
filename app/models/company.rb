class Company < ActiveRecord::Base
  belongs_to :branch_office
  validates :clave,
    :nombre_de_empresa,
    :razon_social,
    :calle,
    :numero_exterior,
    :numero_interior,
    :colonia,
    :codigo_postal,
    :municipio,
    :estado,
    :apellido_paterno,
    :apellido_materno,
    :nombre_1,
    :telefono_de_oficina,
    :telefono_celular,
    :correo_electronico_1,
    :comicion_por_cobranza,
    :comicion_por_colocacion,
    :monto_maximo_de_prestamo,
    :permitir_prestamo_multiple,
    :branch_office_id,
  presence: true
  
end
