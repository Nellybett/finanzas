class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :reason
      t.string :amount
      t.date :request_date
      t.string :name
      t.string :identification
      t.string :account_type
      t.string :account_number
      t.string :bank
      t.string :para
      t.references :user

      t.timestamps
    end
    add_index :requests, :user_id
  end
end
