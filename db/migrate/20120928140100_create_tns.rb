class CreateTns < ActiveRecord::Migration
  def change
    create_table :tns do |t|
      t.string :identification
      t.string :tn_taker
      t.string :tn_name
      t.string :program
      t.string :tn_manager_name
      t.string :tn_manager_email
      t.references :user

      t.timestamps
    end
    add_index :tns, :user_id
  end
end
