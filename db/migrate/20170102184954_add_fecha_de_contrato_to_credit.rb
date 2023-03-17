class AddFechaDeContratoToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :fecha_de_contrato, :date
  end
end
