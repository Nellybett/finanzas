class RenameColumn < ActiveRecord::Migration
  def up
     rename_column :requests, :type, :para
  end

  def down
  end
end
