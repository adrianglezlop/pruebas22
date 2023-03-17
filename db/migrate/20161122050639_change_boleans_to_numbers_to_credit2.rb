class ChangeBoleansToNumbersToCredit2 < ActiveRecord::Migration
  def up
    add_column :credits, :es_cliente, :integer
    add_column :credits, :agente_empresa, :integer
    add_column :credits, :familiar_con_prestamo, :integer
    add_column :credits, :sexo, :integer
  end

  def down
    remove_column :credits, :es_cliente
    remove_column :credits, :agente_empresa
    remove_column :credits, :familiar_con_prestamo
    remove_column :credits, :sexo
  end
end
