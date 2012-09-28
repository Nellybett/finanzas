class AddStatus < ActiveRecord::Migration
  def up
      add_column :requests, :status, :string
  end

  def down
  end
end
