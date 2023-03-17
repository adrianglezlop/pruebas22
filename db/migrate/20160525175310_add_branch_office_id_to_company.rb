class AddBranchOfficeIdToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :branch_office, index: true, foreign_key: true
  end
end
