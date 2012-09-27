class CreateIncomeEvents < ActiveRecord::Migration
  def change
    create_table :income_events do |t|
      t.references :income
      t.references :event

      t.timestamps
    end
    add_index :income_events, :income_id
    add_index :income_events, :event_id
  end
end
