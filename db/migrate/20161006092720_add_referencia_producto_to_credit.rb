class AddReferenciaProductoToCredit < ActiveRecord::Migration
  def change
    add_reference :credits, :product, index: true, foreign_key: true
  end
end
