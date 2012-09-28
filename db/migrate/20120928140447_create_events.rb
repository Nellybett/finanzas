class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :event_date
      t.string :oc
      t.string :description
      t.string :recomendations
      t.string :profit
      t.string :expense
      t.references :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end
