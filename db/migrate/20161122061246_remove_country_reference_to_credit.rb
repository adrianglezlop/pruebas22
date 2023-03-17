class RemoveCountryReferenceToCredit < ActiveRecord::Migration
  def change
    remove_reference :credits, :country, index: true, foreign_key: true
  end
end
