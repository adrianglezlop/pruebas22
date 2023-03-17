class RemoveActividadEconomicaToCredit < ActiveRecord::Migration
  def change
    remove_column :credits, :actividad_econimica, :integer
  end
end
