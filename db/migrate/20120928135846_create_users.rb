class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :area
      t.string :committee
      t.string :password
      t.integer :phone
      t.string :role

      t.timestamps
    end
  end
end
