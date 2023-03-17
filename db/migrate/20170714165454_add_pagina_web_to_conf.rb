class AddPaginaWebToConf < ActiveRecord::Migration
  def change
    add_column :confs, :pagina, :string
  end
end
