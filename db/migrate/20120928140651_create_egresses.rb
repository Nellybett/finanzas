class CreateEgresses < ActiveRecord::Migration
  def change
    create_table :egresses do |t|
      t.string :reason
      t.string :amount
      t.string :type_of_payment
      t.string :operation_number
      t.date :date
      t.string :invoice_number
      t.references :user

      t.timestamps
    end
    add_index :egresses, :user_id
  end
end
