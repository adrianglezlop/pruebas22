class AddNombreCompletoFamiliar1ToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :nombre_completo_familiar_2, :string
  end
end
