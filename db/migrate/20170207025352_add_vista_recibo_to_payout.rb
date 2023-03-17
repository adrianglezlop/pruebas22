class AddVistaReciboToPayout < ActiveRecord::Migration
  def change
    add_column :payouts, :vista, :string
  end
end
