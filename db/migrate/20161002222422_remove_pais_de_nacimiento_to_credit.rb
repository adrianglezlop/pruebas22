class RemovePaisDeNacimientoToCredit < ActiveRecord::Migration
  def change
    remove_column :credits, :pais_de_nacimiento, :string
  end
end
