class CreateEgresses < ActiveRecord::Migration
  def change
    create_table :egresses do |t|
      t.references :user
      t.string :reason
      t.string :amount
      t.string :type_of_Payment
      t.string :operation_Number
      t.date :date
      t.string :invoice_Number

      t.timestamps
    end
    add_index :egresses, :user_id
  end
end
