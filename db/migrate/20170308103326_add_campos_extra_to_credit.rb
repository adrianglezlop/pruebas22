class AddCamposExtraToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :casa_color, :string
    add_column :credits, :cancel_o_porton, :integer
    add_column :credits, :color_de_cancel, :string
    add_column :credits, :caracteristicas_especiales, :text
  end
end
 