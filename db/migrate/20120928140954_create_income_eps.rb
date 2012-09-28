class CreateIncomeEps < ActiveRecord::Migration
  def change
    create_table :income_eps do |t|
      t.references :income
      t.references :ep

      t.timestamps
    end
    add_index :income_eps, :income_id
    add_index :income_eps, :ep_id
  end
end
