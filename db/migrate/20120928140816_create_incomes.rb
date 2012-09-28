class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :reason
      t.string :amount
      t.string :type_of_payment
      t.string :operation_number
      t.date :deposit_date
      t.string :invoice_number
      t.references :user

      t.timestamps
    end
    add_index :incomes, :user_id
  end
end
