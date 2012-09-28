class Request < ActiveRecord::Base
  belongs_to :user
  validates_format_of :amount, :with => /^([0-9]+)(\.[0-9]+)?$/i, :message => "Invalid amount"
  validates_format_of :acount_Number, :with => /^([0-9]+)$/i, :message => "Invalid Account Number"
  validates :account_Type, :inclusion => { :in => %w(corriente ahorro), :message => "%{value} is not a valid type" } 
  attr_accessible :account_Type, :acount_Number, :amount, :bank, :identification, :name, :reason, :request_Date, :para,:user, :status
end
