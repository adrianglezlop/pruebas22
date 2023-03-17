class RemoveAttachmentToCredit < ActiveRecord::Migration
  def up
    remove_attachment :credits, :croquis
  end

  def down
    add_attachment :credits, :croquis
  end
end
