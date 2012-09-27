class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :first_Name
      t.string :last_Name
      t.string :committee
      t.string :password
      t.integer :phone
      t.string :role

      t.timestamps
    end
  end
end
