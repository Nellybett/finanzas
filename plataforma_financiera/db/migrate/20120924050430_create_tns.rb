class CreateTns < ActiveRecord::Migration
  def change
    create_table :tns do |t|
      t.string :tn_Id
      t.string :tn_Taker
      t.string :tn_Name
      t.string :program
      t.string :tn_Manager_Name
      t.string :tn_Manager_Email
      t.references :user

      t.timestamps
    end
    add_index :tns, :user_id
  end
end
