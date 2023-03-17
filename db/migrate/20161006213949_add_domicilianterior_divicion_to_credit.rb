class AddDomicilianteriorDivicionToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :antiguedad_en_el_domicilio_anterior_anos, :integer
    add_column :credits, :antiguedad_en_el_domicilio_anterior_meses, :integer
  end
end
