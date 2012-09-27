class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :event_Date
      t.text :oc
      t.text :description
      t.text :recomendations
      t.string :profit
      t.string :expense
      t.references :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end
