class ChangeCantidaTipoAIntegerToTicket2 < ActiveRecord::Migration
  def up
    add_column :tickets, :cantidad, :decimal
  end
  def down
    remove_column :tickets, :cantidad
  end
end
