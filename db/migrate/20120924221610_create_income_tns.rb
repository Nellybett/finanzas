class CreateIncomeTns < ActiveRecord::Migration
  def change
    create_table :income_tns do |t|
      t.references :income
      t.references :tn

      t.timestamps
    end
    add_index :income_tns, :income_id
    add_index :income_tns, :tn_id
  end
end
