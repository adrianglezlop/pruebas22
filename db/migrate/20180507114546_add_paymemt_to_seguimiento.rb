class AddPaymemtToSeguimiento < ActiveRecord::Migration
  def change
    add_reference :seguimientos, :payment, index: true, foreign_key: true
  end
end
