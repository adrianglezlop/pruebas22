class AddDestinationReferenceToCredit < ActiveRecord::Migration
  def change
    add_reference :credits, :destination, index: true, foreign_key: true
  end
end
