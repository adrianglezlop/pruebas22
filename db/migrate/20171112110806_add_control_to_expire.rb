class AddControlToExpire < ActiveRecord::Migration
  def change
    add_column :expires, :control, :integer
  end
end
