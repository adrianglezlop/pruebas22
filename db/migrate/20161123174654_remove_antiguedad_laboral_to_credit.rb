class RemoveAntiguedadLaboralToCredit < ActiveRecord::Migration
  def change
    remove_column :credits, :antiguedad_laboral, :string
  end
end
