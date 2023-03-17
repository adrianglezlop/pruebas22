class AddLocalidadIdToCredits < ActiveRecord::Migration
  def change
    add_reference :credits, :localidad_cnbv, index: true, foreign_key: true
    add_reference :credits, :state, index: true, foreign_key: true
    add_reference :credits, :country, index: true, foreign_key: true
  end
end
