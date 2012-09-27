class CreateEps < ActiveRecord::Migration
  def change
    create_table :eps do |t|
      t.string :ep_Id
      t.string :ep_Name
      t.string :ep_Lastname
      t.string :program
      t.string :ep_Manager_Name
      t.string :ep_Manager_Email
      t.references :user

      t.timestamps
    end
    add_index :eps, :user_id
  end
end
