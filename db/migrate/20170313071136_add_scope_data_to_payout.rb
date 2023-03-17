class AddScopeDataToPayout < ActiveRecord::Migration
  def change
    add_column :payouts, :scope_data, :text
  end
end
