class AddFechaDeNaciminentoConyugueToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :fecha_de_nacimiento_conyuge, :date
  end
end
