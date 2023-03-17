class AddDesplazamientoImprecionToPayout < ActiveRecord::Migration
  def change
    add_column :payouts, :desplazamiento, :integer
  end
end
