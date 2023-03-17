class ChangeTypesPayment < ActiveRecord::Migration
  def up
    change_table :payments do |t|
      t.change :importe, :decimal, :precision => 10, :scale => 2
      t.change :pago, :decimal, :precision => 10, :scale => 2
      t.change :interes, :decimal, :precision => 10, :scale => 2
    end
  end

  def down
    change_table :payments do |t|
      t.change :importe, :decimal
      t.change :pago, :decimal
      t.change :interes, :decimal
    end
  end
end
