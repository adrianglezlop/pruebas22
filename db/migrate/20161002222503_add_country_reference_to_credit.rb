class AddCountryReferenceToCredit < ActiveRecord::Migration
  def change
    add_reference :credits, :country, index: true, foreign_key: true
  end
end
