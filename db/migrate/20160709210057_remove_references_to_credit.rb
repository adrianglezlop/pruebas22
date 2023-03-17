class RemoveReferencesToCredit < ActiveRecord::Migration
  def change
    remove_column :credits, :pais_de_nacimiento, :string
    remove_column :credits, :estado_actual, :string
    remove_column :credits, :localidad, :string
  end
end
