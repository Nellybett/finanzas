class CreateEgressEvents < ActiveRecord::Migration
  def change
    create_table :egress_events do |t|
      t.references :egress
      t.references :event

      t.timestamps
    end
    add_index :egress_events, :egress_id
    add_index :egress_events, :event_id
  end
end
