class ChangeCantidaTipoAIntegerToTicket < ActiveRecord::Migration
  def up
    remove_column :tickets, :cantidad
  end
  def down
    change_column :tickets, :cantidad, :string
  end
end
