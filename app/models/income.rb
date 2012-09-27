class Income < ActiveRecord::Base
  belongs_to :user
  validates :type_of_Payment, :inclusion => { :in => %w(efectivo transferencia deposito), :message => "%{value} is not a valid type" }
  validates_format_of :operation_Number, :with => /^([0-9]+)$/i, :message => "Invalid Operation Number"
  validates_format_of :invoice_Number, :with => /^([0-9]+)$/i, :message => "Invalid Invoice Number" 
  validates_format_of :amount, :with => /^([0-9]+)(\.[0-9]+)?$/i, :message => "Invalid amount"
  attr_accessible :user, :amount, :deposit_Date, :invoice_Number, :operation_Number, :reason, :type_of_Payment
end
