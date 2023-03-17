class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.text :pdf64
      t.references :credit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
