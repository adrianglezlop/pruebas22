class RemoveReferences2ToCredit < ActiveRecord::Migration
  def change
    remove_reference :credits, :country, index: true, foreign_key: true
    remove_reference :credits, :state, index: true, foreign_key: true
    remove_reference :credits, :localidad_cnbv, index: true, foreign_key: true
  end
end
