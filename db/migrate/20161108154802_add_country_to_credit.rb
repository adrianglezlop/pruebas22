class AddCountryToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :country, :string
  end
end
