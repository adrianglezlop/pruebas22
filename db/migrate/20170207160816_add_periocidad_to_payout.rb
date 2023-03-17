class AddPeriocidadToPayout < ActiveRecord::Migration
  def change
    add_column :payouts, :periocidad, :string
  end
end
