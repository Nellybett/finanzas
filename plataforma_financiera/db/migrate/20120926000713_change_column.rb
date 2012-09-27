class ChangeColumn < ActiveRecord::Migration
   def self.up
      change_table :incomes do |t|
        t.change :amount, :integer
   end
   end
   
   def self.down
     change_table :incomes do |t|
       t.change :amount, :string
     end
   end
end
