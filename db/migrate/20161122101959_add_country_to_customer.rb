class AddCountryToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :country, :string
  end
end
