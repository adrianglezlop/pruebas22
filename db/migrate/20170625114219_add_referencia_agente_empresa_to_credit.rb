class AddReferenciaAgenteEmpresaToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :referencia_agente_empresa, :integer
  end
end
