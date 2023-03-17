class RemoveReferencia3ToCredit < ActiveRecord::Migration
  def change
    remove_column :credits, :nombre_referencia_3, :string
    remove_column :credits, :domicilio_referencia_3, :string
    remove_column :credits, :telefono_fijo_referencia_3, :string
    remove_column :credits, :telefono_celular_referencia_3, :string
  end
end
