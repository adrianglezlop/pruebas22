class CreatePayouts < ActiveRecord::Migration
  def change
    create_table :payouts do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
