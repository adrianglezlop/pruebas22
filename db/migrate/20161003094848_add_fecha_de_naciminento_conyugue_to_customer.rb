class AddFechaDeNaciminentoConyugueToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :fecha_de_nacimiento_conyuge, :date
  end
end
