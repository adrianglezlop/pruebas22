class RemoveReferenciaAgenteEmpresaToCredit < ActiveRecord::Migration
  def change
    remove_column :credits, :referencia_agenteEmpresa, :integer
  end
end
