class AddUserIdToBranchOffice < ActiveRecord::Migration
  def change
    add_reference :branch_offices, :user, index: true, foreign_key: true
  end
end
