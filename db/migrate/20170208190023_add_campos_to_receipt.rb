class AddCamposToReceipt < ActiveRecord::Migration
  def change
    add_column :receipts, :fecha_de_cargo, :date
    add_column :receipts, :agente_empresa, :boolean
    add_column :receipts, :padre_referencia, :int
    add_column :receipts, :nombre, :string
    add_column :receipts, :cantidad, :decimal
    add_column :receipts, :concepto, :string
    add_column :receipts, :atraso, :decimal
  end
end
