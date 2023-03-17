class RemoveVistaToPayout < ActiveRecord::Migration
  def change
    remove_column :payouts, :vista, :string
  end
end
