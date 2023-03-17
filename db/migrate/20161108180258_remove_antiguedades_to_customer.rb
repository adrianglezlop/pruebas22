class RemoveAntiguedadesToCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :antiguedad_en_el_domicilio_anterior, :string
    remove_column :customers, :antiguedad_en_el_domicilio_actual, :string
  end
end
