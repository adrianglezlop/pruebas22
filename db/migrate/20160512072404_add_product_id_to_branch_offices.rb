class AddProductIdToBranchOffices < ActiveRecord::Migration
  def change
    add_reference :branch_offices, :product, index: true, foreign_key: true
  end
end
