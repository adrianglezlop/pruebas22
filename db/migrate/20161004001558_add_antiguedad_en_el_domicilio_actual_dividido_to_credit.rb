class AddAntiguedadEnElDomicilioActualDivididoToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :antiguedad_en_el_domicilio_actual_meses, :integer
    add_column :credits, :antiguedad_en_el_domicilio_actual_anos, :integer
  end
end
