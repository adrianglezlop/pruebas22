class AddOcupationIdToCredit < ActiveRecord::Migration
  def change
    add_reference :credits, :ocupation, index: true, foreign_key: true
    add_column :credits, :ocupacion_del_conyuge, :string
    add_column :credits, :empresa_donde_labora_el_conyuge, :string
  end
end
