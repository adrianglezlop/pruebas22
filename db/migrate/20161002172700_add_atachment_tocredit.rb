class AddAtachmentTocredit < ActiveRecord::Migration
   def up
    add_attachment :credits, :croquis
  end

  def down
    remove_attachment :credits, :croquis
  end
end
