class AddOcupationIdToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :ocupation, index: true, foreign_key: true
    add_column :customers, :ocupacion_del_conyuge, :string
    add_column :customers, :empresa_donde_labora_el_conyuge, :string
  end
end
