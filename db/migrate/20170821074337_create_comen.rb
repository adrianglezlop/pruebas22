class CreateComen < ActiveRecord::Migration
  def change
    create_table :comen do |t|
      t.string :c

      t.timestamps null: false
    end
  end
end
