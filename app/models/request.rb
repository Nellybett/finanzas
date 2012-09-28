class Request < ActiveRecord::Base
  belongs_to :user
  validates_format_of :amount, :with => /^([0-9]+)(\.[0-9]+)?$/i, :message => "Invalid amount"
  validates_format_of :account_number, :with => /^([0-9]+)$/i, :message => "Invalid Account Number"
  attr_accessible :account_type, :account_number, :amount, :bank, :identification, :name, :reason, :request_date, :para,:user, :status
end
