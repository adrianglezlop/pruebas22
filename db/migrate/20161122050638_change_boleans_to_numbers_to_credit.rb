class ChangeBoleansToNumbersToCredit < ActiveRecord::Migration
  def up
    remove_column :credits, :es_cliente
    remove_column :credits, :agente_empresa
    remove_column :credits, :familiar_con_prestamo
    remove_column :credits, :sexo
  end

  def down
    change_column :credits, :es_cliente, :boolean
    change_column :credits, :agente_empresa, :boolean
    change_column :credits, :familiar_con_prestamo, :boolean
    change_column :credits, :sexo, :boolean
  end
end
