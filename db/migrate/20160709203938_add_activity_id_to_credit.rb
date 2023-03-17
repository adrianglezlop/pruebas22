class AddActivityIdToCredit < ActiveRecord::Migration
  def change
    add_reference :credits, :economical_activity, index: true, foreign_key: true
  end
end
