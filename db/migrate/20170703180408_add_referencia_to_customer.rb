class AddReferenciaToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :referencia_agente_empresa, :integer
  end
end
