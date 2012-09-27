class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :reason
      t.string :amount
      t.date :request_Date
      t.string :name
      t.string :identification
      t.string :account_Type
      t.string :acount_Number
      t.string :bank
      t.string :type
      t.references :user

      t.timestamps
    end
    add_index :requests, :user_id
  end
end
