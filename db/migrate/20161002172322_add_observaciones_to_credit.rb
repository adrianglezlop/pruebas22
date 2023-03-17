class AddObservacionesToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :observaciones, :text
  end
end
