class AddPdf64ToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :pdf64, :text
  end
end
