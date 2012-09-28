class Egress < ActiveRecord::Base
  belongs_to :user
  validates :type_of_payment, :inclusion => { :in => %w(efectivo transferencia deposito), :message => "%{value} is not a valid type" }
  validates_format_of :operation_number, :with => /^([0-9]+)$/i, :message => "Invalid Operation Number"
  validates_format_of :invoice_number, :with => /^([0-9]+)$/i, :message => "Invalid Invoice Number" 
  validates_format_of :amount, :with => /^([0-9]+)(\.[0-9]+)?$/i, :message => "Invalid amount"
  attr_accessible :user, :amount, :date, :invoice_number, :operation_number, :reason, :type_of_payment
end
