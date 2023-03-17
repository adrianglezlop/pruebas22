class ChangeTypeOfFechaDeNacimientoToAgent < ActiveRecord::Migration
  def change
    change_column :agents, :fecha_de_nacimiento,  :datetime
  end
end
