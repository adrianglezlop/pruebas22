class RemoveReferenciaToCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :referencia_agenteEmpresa, :integer
  end
end
