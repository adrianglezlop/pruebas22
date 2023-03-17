class AddBranchOfficeIdToAgent < ActiveRecord::Migration
  def change
    add_reference :agents, :branch_office, index: true, foreign_key: true
  end
end
