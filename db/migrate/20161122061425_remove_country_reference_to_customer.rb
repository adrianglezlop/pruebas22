class RemoveCountryReferenceToCustomer < ActiveRecord::Migration
  def change
    remove_reference :customers, :country, index: true, foreign_key: true
  end
end
