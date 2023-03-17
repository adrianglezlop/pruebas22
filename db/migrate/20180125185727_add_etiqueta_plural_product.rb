class AddEtiquetaPluralProduct < ActiveRecord::Migration
  def change
    add_column :products, :etiqueta_plural, :string
  end
end
