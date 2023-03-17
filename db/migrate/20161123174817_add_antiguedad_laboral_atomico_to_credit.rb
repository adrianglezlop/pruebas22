class AddAntiguedadLaboralAtomicoToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :antiguedad_laboral_anos, :integer
    add_column :credits, :antiguedad_laboral_meses, :integer
  end
end
