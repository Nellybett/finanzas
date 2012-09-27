class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.references :user
      t.string :reason
      t.string :amount
      t.string :type_of_Payment
      t.string :operation_Number
      t.date :deposit_Date
      t.string :invoice_Number

      t.timestamps
    end
    add_index :incomes, :user_id
  end
end
