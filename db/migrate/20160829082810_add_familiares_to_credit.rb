class AddFamiliaresToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :nombre_completo_familiar_3, :string
    add_column :credits, :parentesco_3, :string
    add_column :credits, :nombre_completo_familiar_4, :string
    add_column :credits, :parentesco_4, :string
  end
end
