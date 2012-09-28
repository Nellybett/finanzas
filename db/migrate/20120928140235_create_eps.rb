class CreateEps < ActiveRecord::Migration
  def change
    create_table :eps do |t|
      t.string :identification
      t.string :ep_name
      t.string :ep_lastname
      t.string :program
      t.string :ep_manager_name
      t.string :ep_manager_email
      t.references :user

      t.timestamps
    end
    add_index :eps, :user_id
  end
end
